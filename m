Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA8FE2C1E
	for <lists+freedreno@lfdr.de>; Thu, 24 Oct 2019 10:27:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2039C6E155;
	Thu, 24 Oct 2019 08:27:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 354B56E155
 for <freedreno@lists.freedesktop.org>; Thu, 24 Oct 2019 08:27:23 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id e11so16305405wrv.4
 for <freedreno@lists.freedesktop.org>; Thu, 24 Oct 2019 01:27:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mm17BkOc25h13Mby6hFCXW3PUeV4hyrd6orfDcJCo64=;
 b=l3eJa2pwAbPfTHa1Vpy86B5ogfLFaihiewK9/LChm+zBxW8nSsAvNKZ0yqShlTblQF
 UsWG12EHJV9ucw8e9A/FDYvDXA9RFgNF5e+GsY/HRKkc8d7bBGMNeRmhJb3TttWSQVfh
 uO/EsxVEyCP16gW38tDkCxDoFuFgQDma+7AzLML56AASso93cHAPawTasbLUWQsWlX4d
 OOZ0u6NkU+Jvw33P9Ts8VJEdqluS90e5b1hzZweh8+iTe48KomzXyJmbAxZa8HnRsKXU
 uGMXIcX31Xohs4zzMVXFcLIsqTcsbEwd1CUOcg1tOv1VEDJkAHv7ncxZRFPycUx7/wqQ
 vfMw==
X-Gm-Message-State: APjAAAXTr9wEAE0UcY/I7Mdxj04nbMZK7lyhrtvtt/7svNkXODQi4IFd
 1r+g2Y6EHSUY5W/iN/M/9vhIfugd3xs+SQ==
X-Google-Smtp-Source: APXvYqxJjkvfXJJpszKYABlj+Cxk0Xu169hSNKRrK3KCT1UvqEPCoE4AIymOmMJ+q88rM3pV+SFBJw==
X-Received: by 2002:a5d:464f:: with SMTP id j15mr2639402wrs.366.1571905641248; 
 Thu, 24 Oct 2019 01:27:21 -0700 (PDT)
Received: from [192.168.27.135] ([37.157.136.206])
 by smtp.googlemail.com with ESMTPSA id u187sm704735wme.15.2019.10.24.01.27.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 24 Oct 2019 01:27:20 -0700 (PDT)
To: Brian Masney <masneyb@onstation.org>
References: <20191013080804.10231-1-masneyb@onstation.org>
 <20191013080804.10231-6-masneyb@onstation.org>
 <d154b0c6-fc39-bebc-d1b5-cc179fb6055d@linaro.org>
 <20191023124753.GA14218@onstation.org>
 <c26159f5-e6fe-07f1-51b3-50b72b258846@linaro.org>
 <20191024070730.GA19974@onstation.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <5e1149ae-9539-ec8b-6371-50c87575057a@linaro.org>
Date: Thu, 24 Oct 2019 11:27:18 +0300
MIME-Version: 1.0
In-Reply-To: <20191024070730.GA19974@onstation.org>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=mm17BkOc25h13Mby6hFCXW3PUeV4hyrd6orfDcJCo64=;
 b=FM2nQuhqEHC5AtVx/Atcs/KmjN9GidOdQUdWc0fquAJ4AIkE9OhBpZfBhwmt+L62d9
 5kjVegAA6W3iU7uZJd+XQIh/YNIWVenayIvbvVgMUiybaDvLhFEtgQgNpWbnTDnGuNkN
 jhVNzvREJ+tiPEfyTyDF2GiVdv3xk4jKbp4v+l3o8oAPvEnOzrOisaO+pPFQM9FsXOSS
 BKs58eHhZv11IhkDZQx2wQ974lIf8sPQOUb/Rj2XMR6C7c6taCX9tJ7tmib8KNplJy+a
 yvNBUtxCN8e74fS6UOFPdIlmAHdVLU80gWta+FQx77WAqsCaJihm96bstIRVHOzm5COF
 yjgg==
Subject: Re: [Freedreno] [PATCH 5/5] ARM: dts: qcom: msm8974: add
 interconnect nodes
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, bjorn.andersson@linaro.org, agross@kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gMjQuMTAuMTkg0LMuIDEwOjA3INGHLiwgQnJpYW4gTWFzbmV5IHdyb3RlOgo+IE9uIFdlZCwg
T2N0IDIzLCAyMDE5IGF0IDA0OjM5OjIxUE0gKzAzMDAsIEdlb3JnaSBEamFrb3Ygd3JvdGU6Cj4+
IE9uIDIzLjEwLjE5INCzLiAxNTo0NyDRhy4sIEJyaWFuIE1hc25leSB3cm90ZToKPj4+IE9uIFdl
ZCwgT2N0IDIzLCAyMDE5IGF0IDAyOjUwOjE5UE0gKzAzMDAsIEdlb3JnaSBEamFrb3Ygd3JvdGU6
Cj4+Pj4gT24gMTMuMTAuMTkg0LMuIDExOjA4INGHLiwgQnJpYW4gTWFzbmV5IHdyb3RlOgo+Pj4+
PiBBZGQgaW50ZXJjb25uZWN0IG5vZGVzIHRoYXQncyBuZWVkZWQgdG8gc3VwcG9ydCBidXMgc2Nh
bGluZy4KPj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogQnJpYW4gTWFzbmV5IDxtYXNuZXliQG9u
c3RhdGlvbi5vcmc+Cj4+Pj4+IC0tLQo+Pj4+PiAgYXJjaC9hcm0vYm9vdC9kdHMvcWNvbS1tc204
OTc0LmR0c2kgfCA2MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+Pj4+PiAgMSBmaWxl
IGNoYW5nZWQsIDYwIGluc2VydGlvbnMoKykKPj4+Pj4KPj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gv
YXJtL2Jvb3QvZHRzL3Fjb20tbXNtODk3NC5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvcWNvbS1t
c204OTc0LmR0c2kKPj4+Pj4gQEAgLTExNTIsNiArMTIwNywxMSBAQAo+Pj4+PiAgCQkJCSAgICAg
ICAgICAgICAgImNvcmUiLAo+Pj4+PiAgCQkJCSAgICAgICAgICAgICAgInZzeW5jIjsKPj4+Pj4g
IAo+Pj4+PiArCQkJCWludGVyY29ubmVjdHMgPSA8Jm1tc3Nub2MgTU5PQ19NQVNfR1JBUEhJQ1Nf
M0QgJmJpbWMgQklNQ19TTFZfRUJJX0NIMD4sCj4+Pj4+ICsJCQkJICAgICAgICAgICAgICAgIDwm
b2NtZW1ub2MgT0NNRU1fVk5PQ19NQVNfR0ZYM0QgJm9jbWVtbm9jIE9DTUVNX1NMVl9PQ01FTT47
Cj4+Pj4KPj4+PiBXaG8gd2lsbCBiZSB0aGUgcmVxdWVzdGluZyBiYW5kd2lkdGggdG8gRERSIGFu
ZCBvY21lbT8gSXMgaXQgdGhlIGRpc3BsYXkgb3IgR1BVCj4+Pj4gb3IgYm90aD8gVGhlIGFib3Zl
IHNlZW0gbGlrZSBHUFUtcmVsYXRlZCBpbnRlcmNvbm5lY3RzLCBzbyBtYXliZSB0aGVzZQo+Pj4+
IHByb3BlcnRpZXMgc2hvdWxkIGJlIGluIHRoZSBHUFUgRFQgbm9kZS4KPj4+Cj4+PiBUaGUgZGlz
cGxheSBpcyB3aGF0IGN1cnJlbnRseSByZXF1ZXN0cyB0aGUgaW50ZXJjb25uZWN0IHBhdGgsCj4+
PiBzcGVjaWZpY2FsbHkgbWRwNV9zZXR1cF9pbnRlcmNvbm5lY3QoKSBpbgo+Pj4gZHJpdmVycy9n
cHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9rbXMuYy4gVGhlIEZyZWVkcmVubyBHUFUgYmluZGlu
Z3MKPj4+IGN1cnJlbnRseSBkb24ndCBoYXZlIGludGVyY29ubmVjdCBzdXBwb3J0LiBNYXliZSB0
aGlzIGlzIHNvbWV0aGluZyB0aGF0Cj4+PiBJIHNob3VsZCBhZGQgdG8gdGhhdCBkcml2ZXIgYXMg
d2VsbD8KPj4KPj4gVGhlICJtZHAwLW1lbSIgYW5kICJtZHAxLW1lbSIgcGF0aHMgbWVudGlvbmVk
IGluIHRoZSBtZHA1X2ttcy5jIGFyZSB0aGUgdHdvCj4+IGludGVyY29ubmVjdHMgYmV0d2VlbiB0
aGUgZGlzcGxheSBhbmQgRERSIG1lbW9yeS4KPiAKPiBPSywgSSBzZWUuIE1vc3Qgb2YgdGhlIGlu
dGVyY29ubmVjdCBwYXRocyBpbiB0aGUgZG93bnN0cmVhbSBNU00gMy40Cj4gc291cmNlcyBhcmUg
Y29uZmlndXJlZCBpbiBkZXZpY2UgdHJlZSB1c2luZyB0aGUKPiBxY29tLG1zbS1idXMsdmVjdG9y
cy1LQnBzIHByb3BlcnR5LCB3aGljaCBpcyB3aGF0IEkgd2FzIG9ubHkgbG9va2luZyBhdAo+IGJl
Zm9yZS4gVGhlIGludGVyY29ubmVjdCBwYXRoIGZvciB0aGUgZGlzcGxheSBpcyBjb25maWd1cmVk
IGRpcmVjdGx5IGluCj4gY29kZSAoZHJpdmVycy92aWRlby9tc20vbWRzcy9tZHNzX21kcC5jKSB0
byBzZXR1cCBhIHBhdGggYmV0d2Vlbgo+IE1TTV9CVVNfTUFTVEVSX01EUF9QT1JUMCBhbmQgTVNN
X0JVU19TTEFWRV9FQklfQ0gwLgoKQ29ycmVjdCEKCj4gCj4gSW4gdGhlIHVwc3RyZWFtIGtlcm5l
bCwgaXQgbG9va3MgbGlrZSBJJ2xsIG5lZWQgdG8KPiAKPiAgIDEpIGFkZCBzdXBwb3J0IGZvciBh
biBvcHRpb25hbCBzZWNvbmQgaW50ZXJjb25uZWN0IHBhdGggZm9yIG9jbWVtIHRvCj4gICAgICBk
cml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hZHJlbm9fZ3B1LmMuCgpZZXMsIGp1c3QgY2hlY2sg
aWYgdGhlcmUgaXMgYSAiZ3B1LW9jbWVtIiBwYXRoIGluIERUIGFuZCBzY2FsZSBpdCB3aGVuIG5l
ZWRlZC4KCj4gCj4gICAyKSBhZGQgaW1wbGVtZW50YXRpb25zIG9mIGdwdV9nZXRfZnJlcSBhbmQg
Z3B1X2dldF9mcmVxIHRvIHRoZQo+ICAgICAgYWRyZW5vX2dwdV9mdW5jcyBzdHJ1Y3QgaW4gZHJp
dmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTN4eF9ncHUuYy4KPiAKCk1heWJlLCBpIGFtIG5vdCB2
ZXJ5IGZhbWlsaWFyIHdpdGggYWRyZW5vIHN0dWZmLiBJdCBtaWdodCBiZSBnb29kIHRvIENDIHRo
ZQpmcmVlZHJlbm8gZ3V5cy4KClRoYW5rcywKR2VvcmdpCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5v
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==
