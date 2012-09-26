#import "ViewController.h"
#import "AFHTTPRequestOperation.h"

@interface ViewController ()
-(void) showMessage:(NSString *) message;
-(NSString *) downloadSavePathFor:(NSString *) filename;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	progressBar.progress = 0;
	progressBar.hidden = YES;
	loadingIndicator.hidden = YES;
}

- (void)viewDidUnload {
	[progressBar release];
	progressBar = nil;
	[loadingIndicator release];
	loadingIndicator = nil;
    [super viewDidUnload];
}

-(IBAction)startDownload:(id)sender {
	NSURL *url = [NSURL URLWithString:downloadField.text];
	NSURLRequest *request = [NSURLRequest requestWithURL:url];
	NSString *saveFilename = [self downloadSavePathFor:url.lastPathComponent];
	
	NSLog(@"Salvando o arquivo em %@", saveFilename);
	
	AFHTTPRequestOperation *operation = [[[AFHTTPRequestOperation alloc] initWithRequest:request] autorelease];
	operation.outputStream = [NSOutputStream outputStreamToFileAtPath:saveFilename append:NO];
	
	[operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *op, NSHTTPURLResponse *response) {
		[loadingIndicator stopAnimating];
		loadingIndicator.hidden = YES;
		
		[self showMessage:@"Download finalizado com sucesso"];
	}
	failure:^(AFHTTPRequestOperation *op, NSError *error) {
		[self showMessage:[NSString stringWithFormat:@"Erro no download: %@", [error localizedDescription]]];
	}];
	
	[operation setDownloadProgressBlock:^(NSInteger bytesRead, NSInteger totalBytesRead, NSInteger totalBytesExpectedToRead) {
		progressBar.progress = (float)totalBytesRead / (float)totalBytesExpectedToRead;		
	}];
	
	progressBar.hidden = NO;
	loadingIndicator.hidden = NO;
	[loadingIndicator startAnimating];
	
	[operation start];
}

-(NSString *) downloadSavePathFor:(NSString *) filename {
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsPath = [paths objectAtIndex:0];
	return [documentsPath stringByAppendingPathComponent:filename];
}

-(void) showMessage:(NSString *) message {
	UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"Aviso" 
		message:message 
		delegate:nil 
		cancelButtonTitle:@"OK" 
		otherButtonTitles:nil] autorelease];
		
	[alert show];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}

- (void)dealloc {
	[downloadField release];
	[progressBar release];
	[loadingIndicator release];
	[super dealloc];
}
@end
