Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EBE7084E
	for <lists+freedreno@lfdr.de>; Mon, 22 Jul 2019 20:20:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6007E89DA5;
	Mon, 22 Jul 2019 18:20:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B5F89DA2
 for <freedreno@lists.freedesktop.org>; Mon, 22 Jul 2019 18:20:27 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id c202so13937686ybf.0
 for <freedreno@lists.freedesktop.org>; Mon, 22 Jul 2019 11:20:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=i9YD5G8HAMrMrwipZFF5d7e55WgOTsCxcFVl1IuaGhA=;
 b=KyXoeEZv7hQSmgadyuaQN3WqRWnmeS3602pO5c+L+SXYRo+bAW5yosxRsIZGsppGRp
 qzIrA1bksn631rUFKzznVpa1BcZTPIsP26Zup4IE1RbLU2dZw6RVXJw6J8W2oLWtsvzR
 5WthMfm1C9tsvaU7CzMQOBts5w+LsAnHFVnqVOsGhA4sVWik1tZDtPrHUCh1krAjbJFb
 9cVNaWwR2xzpjwry/OFW7+8D23F9Mag5LPtfs1M6JY63KijtgtW/pu9BUHvGDf4Ws6cQ
 KzuNZL9oazZ8VElIYW/8aD5IAwWpfbBA0JgrstZ2zZLI4KHc0Aj6Hq0iz1FKYKG4YqgK
 kMrw==
X-Gm-Message-State: APjAAAU84CWPS9kdsU919DTa/MZ8RTMHUE5nktgAG/PSNxyEoAmSkQPC
 +TXo8o1BpgAsbvPlBxcH4rRxew==
X-Google-Smtp-Source: APXvYqx+kr/znTWvRUNj/wBR92LmePqwvp+IiGg/iAGQJYNSI5XDcmCJwEIZdXRoBik7k6teTSAf5g==
X-Received: by 2002:a5b:405:: with SMTP id m5mr45459571ybp.261.1563819626843; 
 Mon, 22 Jul 2019 11:20:26 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id 206sm9444775ywk.44.2019.07.22.11.20.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 11:20:26 -0700 (PDT)
Date: Mon, 22 Jul 2019 14:20:25 -0400
From: Sean Paul <sean@poorly.run>
To: Shubhashree Dhar <dhar@codeaurora.org>
Message-ID: <20190722182025.GF104440@art_vandelay>
References: <1561357632-15361-1-git-send-email-dhar@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1561357632-15361-1-git-send-email-dhar@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=i9YD5G8HAMrMrwipZFF5d7e55WgOTsCxcFVl1IuaGhA=;
 b=ak5c6nStqCuj2CKoFKbZr8QeS33wn5Tkzs0ZNi0q36+RLFltvOc0xeXTsHIz3N4UPk
 QJOy5ScCXwQm/3oHhiQaIpuojW2iEccYAtg35XNPm0ZlLjgw08ka4xl+NLI1yhxGKvRH
 j6vEXEAz/p4xsMvBZEflj7DTIX37B05LXzhVk58xGpC2nt+tKbMV5UO2QYXFtxADJcTZ
 0YUjHcpfFssACDyQZD2Pd2K9Emq+rQPEcUhyFCuwv4gM4l86SpyIiOzB215sShGcxpA7
 UtSy4Bplog61zuI3HZX5BnDFxnRFYGq7e2dGsnSFlTGpuk5PKHBcWBEOq9v/k1WxPReP
 E+rw==
Subject: Re: [Freedreno] drm/msm/dpu: Correct dpu encoder spinlock
 initialization
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jshekhar@codeaurora.org, robdclark@gmail.com, nganji@codeaurora.org,
 seanpaul@chromium.org, abhinavk@codeaurora.org, hoegsberg@chromium.org,
 freedreno@lists.freedesktop.org, jsanka@codeaurora.org,
 chandanu@codeaurora.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgMTE6NTc6MTJBTSArMDUzMCwgU2h1Ymhhc2hyZWUgRGhh
ciB3cm90ZToKPiBkcHUgZW5jb2RlciBzcGlubG9jayBzaG91bGQgYmUgaW5pdGlhbGl6ZWQgZHVy
aW5nIGRwdSBlbmNvZGVyCj4gaW5pdCBpbnN0ZWFkIG9mIGRwdSBlbmNvZGVyIHNldHVwIHdoaWNo
IGlzIHBhcnQgb2YgY29tbWl0Lgo+IFRoZXJlIGFyZSBjaGFuY2VzIHRoYXQgdmJsYW5rIGNvbnRy
b2wgdXNlcyB0aGUgdW5pbml0aWFsaXplZAo+IHNwaW5sb2NrIGlmIG5vdCBpbml0aWFsaXplZCBk
dXJpbmcgZW5jb2RlciBpbml0Lgo+IAo+IENoYW5nZS1JZDogSTVhMThiOTVmYTQ3Mzk3YzgzNGEy
NjZiMjJhYmYzM2E1MTdiMDNhNGUKPiBTaWduZWQtb2ZmLWJ5OiBTaHViaGFzaHJlZSBEaGFyIDxk
aGFyQGNvZGVhdXJvcmEub3JnPgoKVGhhbmtzIGZvciB5b3VyIHBhdGNoLgoKSSd2ZSByZXNvbHZl
ZCB0aGUgY29uZmxpY3QgYW5kIHR3ZWFrZWQgdGhlIGNvbW1pdCBtZXNzYWdlIGEgYml0IHRvIHJl
ZmxlY3QKY3VycmVudCByZWFsaXR5LgoKQXBwbGllZCB0byBkcm0tbWlzYy1maXhlcyBmb3IgNS4z
CgpTZWFuCgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rl
ci5jIHwgMyArLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVf
ZW5jb2Rlci5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXIuYwo+
IGluZGV4IDVmMDg1YjUuLjIyOTM4YzcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21z
bS9kaXNwL2RwdTEvZHB1X2VuY29kZXIuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlz
cC9kcHUxL2RwdV9lbmNvZGVyLmMKPiBAQCAtMjE5NSw4ICsyMTk1LDYgQEAgaW50IGRwdV9lbmNv
ZGVyX3NldHVwKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1fZW5jb2RlciAqZW5j
LAo+ICAJaWYgKHJldCkKPiAgCQlnb3RvIGZhaWw7Cj4gIAo+IC0Jc3Bpbl9sb2NrX2luaXQoJmRw
dV9lbmMtPmVuY19zcGlubG9jayk7Cj4gLQo+ICAJYXRvbWljX3NldCgmZHB1X2VuYy0+ZnJhbWVf
ZG9uZV90aW1lb3V0LCAwKTsKPiAgCXRpbWVyX3NldHVwKCZkcHVfZW5jLT5mcmFtZV9kb25lX3Rp
bWVyLAo+ICAJCQlkcHVfZW5jb2Rlcl9mcmFtZV9kb25lX3RpbWVvdXQsIDApOwo+IEBAIC0yMjUw
LDYgKzIyNDgsNyBAQCBzdHJ1Y3QgZHJtX2VuY29kZXIgKmRwdV9lbmNvZGVyX2luaXQoc3RydWN0
IGRybV9kZXZpY2UgKmRldiwKPiAgCj4gIAlkcm1fZW5jb2Rlcl9oZWxwZXJfYWRkKCZkcHVfZW5j
LT5iYXNlLCAmZHB1X2VuY29kZXJfaGVscGVyX2Z1bmNzKTsKPiAgCj4gKwlzcGluX2xvY2tfaW5p
dCgmZHB1X2VuYy0+ZW5jX3NwaW5sb2NrKTsKPiAgCWRwdV9lbmMtPmVuYWJsZWQgPSBmYWxzZTsK
PiAgCj4gIAlyZXR1cm4gJmRwdV9lbmMtPmJhc2U7Cj4gLS0gCj4gMS45LjEKPiAKCi0tIApTZWFu
IFBhdWwsIFNvZnR3YXJlIEVuZ2luZWVyLCBHb29nbGUgLyBDaHJvbWl1bSBPUwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcmVlZHJlbm8gbWFpbGluZyBs
aXN0CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJlbm8=
