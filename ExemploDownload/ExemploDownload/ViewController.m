#import "ViewController.h"
#import "AFNetworking.h"

@interface ViewController ()

@end

@implementation ViewController

-(NSString *) downloadSavePathFor:(NSString *) filename {
	NSArray *paths =
		NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
			NSUserDomainMask, YES);
	NSString *documentsPath = [paths objectAtIndex:0];
	return [documentsPath stringByAppendingPathComponent:filename];
}

-(void) showMessage:(NSString *) message {
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Aviso"
		message:message
		delegate:nil
		cancelButtonTitle:@"OK"
		otherButtonTitles:nil];
	
	[alert show];
}

-(IBAction)startDownload:(id)sender {
	NSURL *url = [NSURL URLWithString:_downloadField.text];
	NSURLRequest *request = [NSURLRequest requestWithURL:url];
	NSString *saveFilename =
	[self downloadSavePathFor:url.lastPathComponent];
	
	NSLog(@"Salvando o arquivo em %@", saveFilename);
	
	AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]
		initWithRequest:request];

	operation.outputStream = [NSOutputStream
		outputStreamToFileAtPath:saveFilename append:NO];
	
	[operation setCompletionBlockWithSuccess:
	 	^(AFHTTPRequestOperation *op, NSHTTPURLResponse *response) {
		 	[_loading stopAnimating];
		 	_loading.hidden = YES;
			 [self showMessage:@"Download finalizado com sucesso"];
	 	}
		failure:^(AFHTTPRequestOperation *op, NSError *error) {
			[self showMessage:
				[NSString stringWithFormat:@"Erro no download: %@",
				[error localizedDescription]]];
		}
	];
	
	[operation setDownloadProgressBlock:
		^(NSUInteger read, long long totalRead, long long totalExpected) {
		_progressBar.progress = (float)totalRead / (float)totalExpected;
	}];
	
	_progressBar.hidden = NO;
	_progressBar.progress = 0;
	_loading.hidden = NO;
	[_loading startAnimating];
	
	[operation start];
}

@end
