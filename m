Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B4FEEA01
	for <lists+freedreno@lfdr.de>; Mon,  4 Nov 2019 21:42:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 333FD6E863;
	Mon,  4 Nov 2019 20:42:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5069D6E863
 for <freedreno@lists.freedesktop.org>; Mon,  4 Nov 2019 20:42:24 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id 3so13230037pfb.10
 for <freedreno@lists.freedesktop.org>; Mon, 04 Nov 2019 12:42:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6/9m8wELRRDxWE7OlbiB0B3Q1hTAzR2tNA33WCbLmsw=;
 b=i5aROBmh/8FFULjzjDa9dD93z9fcSGa307fTJMLPnJV86KRVa2CdgXX9EQdK8exAVd
 Is3TstwzCZucLGAEhZtlo+6qYcgXBNLuct0TOBvNNVNTzLJvqxYJaY+JunMi0n6L1a3q
 FJ/PZEeb3UxSNcBRi01qJgXq1QeXZkHxPK1D6ZefBV2ExY3arUXJbWppluRqJehT+y4/
 BWFL2qQ9Mu6eLhhL7U1uNQ24u/sEkWDd106yK0+bQ2tzTGJtxwes8ElNqiGQ0KDNDU7B
 8fhMG0Oka7l0HhK5lpgwXzXNAPoJNp2OyBAGLNkuDC1oo9gReobihhs6wuIcphKUjwMc
 LcBQ==
X-Gm-Message-State: APjAAAVTa2PtTbyo98PSlssrNYJkkcHUDtfj7kszDCcmetND8xxLZfUK
 8EbUBpTwuI06bhq1APL3Q4T3bA==
X-Google-Smtp-Source: APXvYqxKo9EGtLoPwts9dEnyGmVK3HmiyacvdHbMr4orZaBYx4eTzyEWx4c8n8FjfAnxRZ1deQ1UBw==
X-Received: by 2002:a63:ec4b:: with SMTP id r11mr31741370pgj.147.1572900143578; 
 Mon, 04 Nov 2019 12:42:23 -0800 (PST)
Received: from tuxbook-pro (pat_11.qualcomm.com. [192.35.156.11])
 by smtp.gmail.com with ESMTPSA id n8sm8714053pja.30.2019.11.04.12.42.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2019 12:42:22 -0800 (PST)
Date: Mon, 4 Nov 2019 12:42:20 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: kholk11@gmail.com
Message-ID: <20191104204220.GB586@tuxbook-pro>
References: <20191031104402.31813-1-kholk11@gmail.com>
 <20191031104402.31813-6-kholk11@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191031104402.31813-6-kholk11@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=6/9m8wELRRDxWE7OlbiB0B3Q1hTAzR2tNA33WCbLmsw=;
 b=OdxYxVSVQHvqXu5SKnoyvE3TkGJTpN2Vz+UnWjjn6DRcm3LgmX/pGG5UeLpbYSsuH5
 sjmJDv0xugSDXNI5icN693KOUFS2fW+0XEnH6GmbSDhGM4UHGaLSBXobpqbr8SmHgOUw
 a15pVeYOelcGy3ooGUKqHFSgex9wrO8LG4rtKaA+Pq5CGR6HLDkpMXxxkfnMeo//19Ie
 GUMTOwi5j9JgFxFqlOq0BcYdnAOkq63bdLD9GBo28GZFCaJPE7xoYjB2FGQkjVD1MUv/
 US6oSbBDXgWvqPoPdDVu0YDBOYPkM1JLN8c0JOKcgBlj1RMm4m9hSGsxyYxSuqydHLlv
 42Sw==
Subject: Re: [Freedreno] [PATCH v4 5/7] dt-bindings: msm/dsi: Add 28nm PLL
 for family B compatible
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
Cc: mark.rutland@arm.com, freedreno@lists.freedesktop.org, marijns95@gmail.com,
 jonathan@marek.ca, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, robh+dt@kernel.org,
 daniel@ffwll.ch, gregkh@linuxfoundation.org, tglx@linutronix.de,
 sean@poorly.run, georgi.djakov@linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gVGh1IDMxIE9jdCAwMzo0NCBQRFQgMjAxOSwga2hvbGsxMUBnbWFpbC5jb20gd3JvdGU6Cgo+
IEZyb206IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxraG9sazExQGdtYWlsLmNvbT4KPiAK
PiBPbiBmYW1pbHkgQiBTb0NzLCB0aGUgMjhubSBQTEwgaGFzIGEgZGlmZmVyZW50IGlvc3BhY2Ug
YWRkcmVzcwo+IGFuZCB0aGF0IHJlcXVpcmVkIGEgbmV3IGNvbXBhdGlibGUgaW4gdGhlIGRyaXZl
ci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8a2hvbGsx
MUBnbWFpbC5jb20+Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L21zbS9kc2kudHh0IHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9tc20vZHNpLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L21zbS9kc2kudHh0Cj4gaW5kZXggYWY5NTU4NmM4OThmLi5kM2JhOWVlMjJmMzggMTAwNjQ0
Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXNtL2Rz
aS50eHQKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9t
c20vZHNpLnR4dAo+IEBAIC04Myw2ICs4Myw3IEBAIERTSSBQSFk6Cj4gIFJlcXVpcmVkIHByb3Bl
cnRpZXM6Cj4gIC0gY29tcGF0aWJsZTogQ291bGQgYmUgdGhlIGZvbGxvd2luZwo+ICAgICogInFj
b20sZHNpLXBoeS0yOG5tLWhwbSIKPiArICAqICJxY29tLGRzaS1waHktMjhubS1ocG0tZmFtLWIi
CgpXb3VsZG4ndCBpdCBiZSBwcmVmZXJhYmxlIHRvIHVzZSBzcGVjaWZpYyBwbGF0Zm9ybSBudW1i
ZXJzIGhlcmU/CgpSZWdhcmRzLApCam9ybgoKPiAgICAqICJxY29tLGRzaS1waHktMjhubS1scCIK
PiAgICAqICJxY29tLGRzaS1waHktMjBubSIKPiAgICAqICJxY29tLGRzaS1waHktMjhubS04OTYw
Igo+IC0tIAo+IDIuMjEuMAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpGcmVlZHJlbm8gbWFpbGluZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9m
cmVlZHJlbm8=
