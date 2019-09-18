Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F112EB62FA
	for <lists+freedreno@lfdr.de>; Wed, 18 Sep 2019 14:21:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCDD26EF14;
	Wed, 18 Sep 2019 12:21:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 398BF6EEEE
 for <freedreno@lists.freedesktop.org>; Wed, 18 Sep 2019 11:51:00 +0000 (UTC)
Received: from willy by bombadil.infradead.org with local (Exim 4.92.2 #3 (Red
 Hat Linux)) id 1iAYU6-0000jz-Q9; Wed, 18 Sep 2019 11:50:58 +0000
Date: Wed, 18 Sep 2019 04:50:58 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Jordan Crouse <jcrouse@codeaurora.org>
Message-ID: <20190918115058.GB9880@bombadil.infradead.org>
References: <1568756922-2829-1-git-send-email-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1568756922-2829-1-git-send-email-jcrouse@codeaurora.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Wed, 18 Sep 2019 12:21:16 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xT04o0lekJxd/aozlQYGw0ZS4okGFGfqXe4QEtUwyYo=; b=q9flpAHDMXxzFuObshYoFv4be
 l4DeXx4V8SrvfAc4numF8OpmqDp8v7qs+KxtSzngtECLx7U1LbsccCx+stgKPiidKUkh54hSVNnr0
 9Sj0Kbpjdp6hILG+2b3vsUeWSmP6INfGpznkdo17UcauUjA5G6ZYhPEVWlO5OwzPplm6UxATM5806
 fMgdqYjfDD7B6c3iRlBTuG2grXovldmp3e9CYL8jKxXlQqerays6DtzrsOslskJ9wtK1Tu6PuxjRB
 m6r4X9EIVY71cnXLrYRwW1A/RcqY0hbyAEt1G7rAIbmfIhPsUmksvnKYZLxGveFJ9l4RYTugEyTIW
 TEr30NsMQ==;
Subject: Re: [Freedreno] [PATCH] idr: Prevent unintended underflow for the
 idr index
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
Cc: linux-fsdevel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMTcsIDIwMTkgYXQgMDM6NDg6NDJQTSAtMDYwMCwgSm9yZGFuIENyb3VzZSB3
cm90ZToKPiBJdCBpcyBwb3NzaWJsZSBmb3IgdW5hd2FyZSBjYWxsZXJzIG9mIHNldmVyYWwgaWRy
IGZ1bmN0aW9ucyB0byBhY2NpZGVudGFsbHkKPiB1bmRlcmZsb3cgdGhlIGluZGV4IGJ5IHNwZWNp
ZnlpbmcgYSBpZCB0aGF0IGlzIGxlc3MgdGhhbiB0aGUgaWRyIGJhc2UuCgpIaSBKb3JkYW4uICBU
aGFua3MgZm9yIHRoZSBwYXRjaCwgYnV0IHRoaXMgc2VlbXMgbGlrZSBhIGRpc3RpbmN0aW9uCndp
dGhvdXQgYSBkaWZmZXJlbmNlLgoKPiAgdm9pZCAqaWRyX3JlbW92ZShzdHJ1Y3QgaWRyICppZHIs
IHVuc2lnbmVkIGxvbmcgaWQpCj4gIHsKPiArCWlmIChpZCA8IGlkci0+aWRyX2Jhc2UpCj4gKwkJ
cmV0dXJuIE5VTEw7Cj4gKwo+ICAJcmV0dXJuIHJhZGl4X3RyZWVfZGVsZXRlX2l0ZW0oJmlkci0+
aWRyX3J0LCBpZCAtIGlkci0+aWRyX2Jhc2UsIE5VTEwpOwoKSWYgdGhpcyB1bmRlcmZsb3dzLCB3
ZSdsbCB0cnkgdG8gZGVsZXRlIGFuIGluZGV4IHdoaWNoIGRvZXNuJ3QgZXhpc3QsCndoaWNoIHdp
bGwgcmV0dXJuIE5VTEwuCgo+ICB2b2lkICppZHJfZmluZChjb25zdCBzdHJ1Y3QgaWRyICppZHIs
IHVuc2lnbmVkIGxvbmcgaWQpCj4gIHsKPiArCWlmIChpZCA8IGlkci0+aWRyX2Jhc2UpCj4gKwkJ
cmV0dXJuIE5VTEw7Cj4gKwo+ICAJcmV0dXJuIHJhZGl4X3RyZWVfbG9va3VwKCZpZHItPmlkcl9y
dCwgaWQgLSBpZHItPmlkcl9iYXNlKTsKCklmIHRoaXMgdW5kZXJmbG93cywgd2UnbGwgbG9vayB1
cCBhbiBlbnRyeSB3aGljaCBkb2Vzbid0IGV4aXN0LCB3aGljaAp3aWxsIHJldHVybiBOVUxMLgoK
PiBAQCAtMzAyLDYgKzMwOCw5IEBAIHZvaWQgKmlkcl9yZXBsYWNlKHN0cnVjdCBpZHIgKmlkciwg
dm9pZCAqcHRyLCB1bnNpZ25lZCBsb25nIGlkKQo+ICAJdm9pZCBfX3JjdSAqKnNsb3QgPSBOVUxM
Owo+ICAJdm9pZCAqZW50cnk7Cj4gIAo+ICsJaWYgKGlkIDwgaWRyLT5pZHJfYmFzZSkKPiArCQly
ZXR1cm4gRVJSX1BUUigtRU5PRU5UKTsKPiArCj4gIAlpZCAtPSBpZHItPmlkcl9iYXNlOwo+ICAK
PiAgCWVudHJ5ID0gX19yYWRpeF90cmVlX2xvb2t1cCgmaWRyLT5pZHJfcnQsIGlkLCAmbm9kZSwg
JnNsb3QpOwoKLi4uIGp1c3Qgb3V0c2lkZSB0aGUgY29udGV4dCBpcyB0aGlzIGxpbmU6CiAgICAg
ICAgaWYgKCFzbG90IHx8IHJhZGl4X3RyZWVfdGFnX2dldCgmaWRyLT5pZHJfcnQsIGlkLCBJRFJf
RlJFRSkpCiAgICAgICAgICAgICAgICByZXR1cm4gRVJSX1BUUigtRU5PRU5UKTsKCkxvb2tpbmcg
dXAgYW4gaW5kZXggd2hpY2ggZG9lc24ndCBleGlzdCBnZXRzIHlvdSBhIE5VTEwgc2xvdCwgc28g
eW91IGdldAotRU5PRU5UIGFueXdheS4KCkkgZGlkIHRoaW5rIGFib3V0IHRoZXNlIHBvc3NpYmls
aXRpZXMgd2hlbiBJIHdhcyB3cml0aW5nIHRoZSBjb2RlIGFuZApjb252aW5jZWQgbXlzZWxmIEkg
ZGlkbid0IG5lZWQgdGhlbS4gIElmIHlvdSBoYXZlIGFuIGV4YW1wbGUgb2YgYSBjYXNlCndoZXJl
IEkgZ290IHRoYXN0IHdyb25nLCBJJ2QgbG92ZSB0byBzZWUgaXQuCgpNb3JlIGdlbmVyYWxseSwg
dGhlIElEUiBpcyBkZXByZWNhdGVkOyBJJ20gdHJ5aW5nIHRvIGNvbnZlcnQgdXNlcnMgdG8KdGhl
IFhBcnJheS4gIElmIHlvdSdyZSBhZGRpbmcgYSBuZXcgdXNlciwgY2FuIHlvdSB1c2UgdGhlIFhB
cnJheSBBUEkKaW5zdGVhZD8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJl
ZWRyZW5v
