Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C99CC10B97
	for <lists+freedreno@lfdr.de>; Wed,  1 May 2019 18:51:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9683D892BE;
	Wed,  1 May 2019 16:51:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C6DB892C1
 for <freedreno@lists.freedesktop.org>; Wed,  1 May 2019 16:51:15 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id h1so8542924pgs.2
 for <freedreno@lists.freedesktop.org>; Wed, 01 May 2019 09:51:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Kd5MuO+17SSO78jER84yawU/+kS4c+qH+M/4Z95iLNY=;
 b=gMQ+X5rdWEeOSPR/Nu2eMMxk1N9DBgQLHSZu2Mrzq9ciGD+zMYHtuT+Sx79nMUOQ6B
 h8diXBBVubngZZfixi7EHAbFP7rJzJumPE0Okt3X+EMrzsUygtOtpYpbbVjb3hQmbU/r
 G/+pnrxWsn8tjhcNUXcauBaYkAManRFjfP2v1pLUkUn9JmfykokTYiTW/H7KC5O2xkeK
 xTrI1S0z6uEE/Puxsg0hqTwXDiUPbS+juFHWpA9I1gYGDcht1++aBc6MKuVjS+QMY35Y
 NKsbdD8O9DLI7ujgAkB6V50sDOvJU0VqAAJU0SNnSkh/X2MmTTWL1CwEgIlvvs82VKhy
 539w==
X-Gm-Message-State: APjAAAX+PavfZRdS/42Ge8OQPNXoZqlIRwiOOPEFS8PeoENz/pXMLcxF
 hBrk8Q4ySkVgeFTlXHgI+4bR4A==
X-Google-Smtp-Source: APXvYqwTaF3lkS2xcbZsYzpMTkI1G6dbKWjh7tN8qOSRuhSBT3G0ZPf6rYTURl8olJfGXJ2vBQZtGw==
X-Received: by 2002:a65:6145:: with SMTP id o5mr17411677pgv.262.1556729474737; 
 Wed, 01 May 2019 09:51:14 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id 18sm58777799pfp.18.2019.05.01.09.51.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 01 May 2019 09:51:13 -0700 (PDT)
Date: Wed, 1 May 2019 09:51:15 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Message-ID: <20190501165115.GH2938@tuxbook-pro>
References: <20190501161437.15728-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190501161437.15728-1-jeffrey.l.hugo@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Kd5MuO+17SSO78jER84yawU/+kS4c+qH+M/4Z95iLNY=;
 b=p4961rDhAAkYdVL2MmCqcSFfDmoIe5vhA3cShJh7egp3Eb4kLmL2sB5jcTZBT1bBrs
 X2UUpPkwn29f2c9UAdFVjJrMkV/aK/zL0MDk5lw3aYKNt8+QE8TalXcEbVeApDAU7UpH
 c/g+s2N/Ee/n2VFwIgnhu9W8R9Ope8RnBjoUlC04/UVVNRV/DsvA60nM2TVkJcPgPPBn
 0NuLBjuj6N2yXocjsMpPtUk0uZ2h6lEVZZCL6NhHgemzzc6Y0KboxPCTpXRsyjpqwnkO
 9Fb6NIX/Wne6nx8wc6NGWcfcJ8cX/arFAHndFz2zwEoeHM97MNQ6pXGTfWQ6ddBRLQBq
 9foA==
Subject: Re: [Freedreno] [PATCH] drm/msm/mdp5: Fix mdp5_cfg_init error return
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, daniel@ffwll.ch,
 sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gV2VkIDAxIE1heSAwOToxNCBQRFQgMjAxOSwgSmVmZnJleSBIdWdvIHdyb3RlOgoKPiBJZiBt
ZHA1X2NmZ19pbml0IGZhaWxzIGJlY2F1c2Ugb2YgYW4gdW5rbm93biBtYWpvciB2ZXJzaW9uLCBh
IG51bGwgcG9pbnRlcgo+IGRlcmVmZXJlbmNlIG9jY3Vycy4gIFRoaXMgaXMgYmVjYXVzZSB0aGUg
Y2FsbGVyIG9mIGluaXQgZXhwZWN0cyBlcnJvcgo+IHBvaW50ZXJzLCBidXQgaW5pdCByZXR1cm5z
IE5VTEwgb24gZXJyb3IuICBGaXggdGhpcyBieSByZXR1cm5pbmcgdGhlCj4gZXhwZWN0ZWQgdmFs
dWVzIG9uIGVycm9yLgo+IAo+IEZpeGVzOiAyZTM2MmUxNzcyYjggKGRybS9tc20vbWRwNTogaW50
cm9kdWNlIG1kcDVfY2ZnIG1vZHVsZSkKClJldmlld2VkLWJ5OiBCam9ybiBBbmRlcnNzb24gPGJq
b3JuLmFuZGVyc3NvbkBsaW5hcm8ub3JnPgoKPiBTaWduZWQtb2ZmLWJ5OiBKZWZmcmV5IEh1Z28g
PGplZmZyZXkubC5odWdvQGdtYWlsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21zbS9k
aXNwL21kcDUvbWRwNV9jZmcuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20v
ZGlzcC9tZHA1L21kcDVfY2ZnLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1
X2NmZy5jCj4gaW5kZXggZWE4ZjdkN2RhZjdmLi41MmUyMzc4MGZjZTEgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9jZmcuYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVfY2ZnLmMKPiBAQCAtNzIxLDcgKzcyMSw3IEBAIHN0
cnVjdCBtZHA1X2NmZ19oYW5kbGVyICptZHA1X2NmZ19pbml0KHN0cnVjdCBtZHA1X2ttcyAqbWRw
NV9rbXMsCj4gIAlpZiAoY2ZnX2hhbmRsZXIpCj4gIAkJbWRwNV9jZmdfZGVzdHJveShjZmdfaGFu
ZGxlcik7Cj4gIAo+IC0JcmV0dXJuIE5VTEw7Cj4gKwlyZXR1cm4gRVJSX1BUUihyZXQpOwo+ICB9
Cj4gIAo+ICBzdGF0aWMgc3RydWN0IG1kcDVfY2ZnX3BsYXRmb3JtICptZHA1X2dldF9jb25maWco
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqZGV2KQo+IC0tIAo+IDIuMTcuMQo+IApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcmVlZHJlbm8gbWFpbGluZyBs
aXN0CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJlbm8=
