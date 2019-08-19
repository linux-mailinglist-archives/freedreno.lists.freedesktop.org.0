Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBD094AEF
	for <lists+freedreno@lfdr.de>; Mon, 19 Aug 2019 18:51:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 148966E233;
	Mon, 19 Aug 2019 16:51:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 492416E233
 for <freedreno@lists.freedesktop.org>; Mon, 19 Aug 2019 16:51:13 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id 4so1229461pld.10
 for <freedreno@lists.freedesktop.org>; Mon, 19 Aug 2019 09:51:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=PF9Fz7eLOn3KOSJvwuGfd7kZcP+Q82SJirXg7MMKVTc=;
 b=rYzCvnFet1PTjt8nMwtLW/G+jvLwYW1p4ElwqKyzyMA2T3ITsVPMNbgTwEC7NaJojU
 C3DP4zcJHvL9Acc++p4/bBVbEhVanIFpuXE9a8mdYKlDdGIhfpzA5Y/To0fi6gNqd2kw
 YUDzC1pf/NOkXntFWRTE8u4mXvrCv0lcfBkXApjJCAYpeRRvluQaiSgLOo2ldXpeAgvn
 DPWuMXkfDi7laYSNUoT+TsM637Ep39gJsqf1VwjVhuytrYmyKPLTQILI8zykfRTN5N60
 rfU8vsaM8FWuoMyMgexUNZV0wgedcqriD9q/m7K+TVBO/8WaXsPr+18n/lXTx8Brr8hO
 tPbQ==
X-Gm-Message-State: APjAAAWxSw/ARj3i3X6uPfskgOvbqygdMd+6AgzaNXZG5YZQU3Q0df3V
 0wkqgC7+m9hHmAA3S7S2HyKT5Q==
X-Google-Smtp-Source: APXvYqy+GZvqO80ibtH+ku91D+7Ug4tpguKdLphDT0NoWOq2CKeFFjM/+4q4NMDcCteJLySS1DmZEg==
X-Received: by 2002:a17:902:141:: with SMTP id
 59mr24103307plb.324.1566233472771; 
 Mon, 19 Aug 2019 09:51:12 -0700 (PDT)
Received: from tuxbook-pro (pat_11.qualcomm.com. [192.35.156.11])
 by smtp.gmail.com with ESMTPSA id i11sm22052392pfk.34.2019.08.19.09.51.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 09:51:11 -0700 (PDT)
Date: Mon, 19 Aug 2019 09:52:55 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Stephen Boyd <sboyd@kernel.org>
Message-ID: <20190819165255.GA26807@tuxbook-pro>
References: <1565037226-1684-1-git-send-email-jcrouse@codeaurora.org>
 <20190807234232.27AA720880@mail.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190807234232.27AA720880@mail.kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=PF9Fz7eLOn3KOSJvwuGfd7kZcP+Q82SJirXg7MMKVTc=;
 b=lHOPAntlcr7DvNNnqvGon8PsmC5KmwzxdXbVCIgrhXAtUPzFHwLR9e4ryWdu1nuSuk
 Ehdt/HQ565j7tizRT6Sk1evJ+r63wY5/uqERuNIBq7QSjdswgd8o9TlmUxV2sdkzTM6e
 FKyUhTMwIM0WiojP3BvTlMSmkshvlivGl1p0HdIAq30G3r6AH0HjcXoU8VgRqnnQ0pRj
 SqLM1uvtl61cfFjNTQUe32kc+gBKyyxdYi4luXvShhmmAtzDlRqCI7EE51g38oJtoMDf
 0AjjxTRurHFWz9s+7bWl02zAqVcKU56b+6UDVJi8MTf2bAp97Z0w/OfFjF2Qtrv0KA+j
 WlkQ==
Subject: Re: [Freedreno] [PATCH v2] drivers: qcom: Add BCM vote macro to
 header
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
Cc: Taniya Das <tdas@codeaurora.org>, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Jordan Crouse <jcrouse@codeaurora.org>, Andy Gross <agross@kernel.org>,
 freedreno@lists.freedesktop.org, Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gV2VkIDA3IEF1ZyAxNjo0MiBQRFQgMjAxOSwgU3RlcGhlbiBCb3lkIHdyb3RlOgoKPiBRdW90
aW5nIEpvcmRhbiBDcm91c2UgKDIwMTktMDgtMDUgMTM6MzM6NDYpCj4gPiBUaGUgbWFjcm8gdG8g
Z2VuZXJhdGUgYSBCdXMgQ29udHJvbGxlciBNYW5hZ2VyIChCQ00pIFRDUyBjb21tYW5kIGlzIHVz
ZWQKPiA+IGJ5IHRoZSBpbnRlcmNvbm5lY3QgZHJpdmVyIGJ1dCBtaWdodCBhbHNvIGJlIGludGVy
ZXN0aW5nIHRvIG90aGVyCj4gPiBkcml2ZXJzIHRoYXQgbmVlZCB0byBjb25zdHJ1Y3QgVENTIGNv
bW1hbmRzIGZvciBzdWIgcHJvY2Vzc29ycyBzbyBtb3ZlCj4gPiBpdCBvdXQgb2YgdGhlIHNkbTg0
NSBzcGVjaWZpYyBmaWxlIGFuZCBpbnRvIHRoZSBoZWFkZXIuCj4gPiAKPiA+IFNpZ25lZC1vZmYt
Ynk6IEpvcmRhbiBDcm91c2UgPGpjcm91c2VAY29kZWF1cm9yYS5vcmc+Cj4gPiAtLS0KPiAKPiBB
Y2tlZC1ieTogU3RlcGhlbiBCb3lkIDxzYm95ZEBrZXJuZWwub3JnPgo+IAo+IFVubGVzcyB0aGlz
IGlzIHN1cHBvc2VkIHRvIGJlIGFwcGxpZWQgYnkgbWU/Cj4gCj4gQlRXLCBJIHdvbmRlciB3aHkg
d2UgbmVlZCBhbiBycG0gY2xrIGRyaXZlciBtdWNoIGF0IGFsbCBub3dhZGF5cywgZXhjZXB0Cj4g
bWF5YmUgZm9yIHRoZSBYTyBjbGsgc3RhdGUuIFRoZSBiaWcgdXNlciwgZnJvbSB3aGF0IEkgY2Fu
IHRlbGwsIGlzIHRoZQo+IGludGVyY29ubmVjdCBkcml2ZXIgYW5kIHdlIGRvbid0IHVzZSBhbnkg
b2YgdGhlIGZlYXR1cmVzIG9mIHRoZSBjbGsKPiBmcmFtZXdvcmsgYmVzaWRlcyB0aGUgQVBJIHRv
IHNldCBhIGZyZXF1ZW5jeS4gTWF5YmUgaXQgd291bGQgYmUgYmV0dGVyCj4gdG8ganVzdCBwdXNo
IHB1c2ggdGhlIGJ1cyBmcmVxdWVuY3kgbG9naWMgaW50byBpbnRlcmNvbm5lY3QgY29kZSwgdGhl
bgo+IFhPIGNsayBpcyB0aGUgb25seSB0aGluZyB3ZSBuZWVkIHRvIGtlZXAsIGFuZCBpdCBjYW4g
YmUgYSBzaW1wbGUgb24vb2ZmCj4gdGhpbmcuCj4gCgpUaGVyZSdzIGJlZW4gYSBudW1iZXIgb2Yg
Y2FzZXMgd2hlcmUgd2UnbGwgbmVlZCB0byBlbmFibGUgdGhlIGJ1ZmZlcmVkClhPcywgYnV0IHBl
cmhhcHMgdGhlc2UgYXJlIGhhbmRsZWQgYnkgb3RoZXIgc3Vic3lzdGVtcyB0aGVzZSBkYXlzKD8p
CgpJZiBzbyB0aGUgb25lIGNhc2UgdGhhdCByZW1haW5zIHdvdWxkIGJlIHRoZSBvcGVyYXRpb24g
b2YgZXhwbGljaXRseQpob2xkaW5nIENYTyBlbmFibGVkIGR1cmluZyBvcGVyYXRpb25zIHN1Y2gg
YXMgYm9vdGluZyB0aGUgcmVtb3RlcHJvY3MuCgpSZWdhcmRzLApCam9ybgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcmVlZHJlbm8gbWFpbGluZyBsaXN0
CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJlbm8=
