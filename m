Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8111177C9
	for <lists+freedreno@lfdr.de>; Mon,  9 Dec 2019 21:52:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42CF789A86;
	Mon,  9 Dec 2019 20:52:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 374E989A86
 for <freedreno@lists.freedesktop.org>; Mon,  9 Dec 2019 20:52:53 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id s18so7833702pfm.4
 for <freedreno@lists.freedesktop.org>; Mon, 09 Dec 2019 12:52:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AvjOGQmItdmAy3vt51SLf/vsbTcB+aY7zT7fuJp4dP4=;
 b=gCG/BdbXqfPRUlWv8azRviZzMqfmbuR2Zn6gSbKFOCahD4yz1QAuZ4wFQKTCB1Ug6m
 BWXLzqyJUH5HmzgduyRXDdazXS2MBJPVO+ix9xMxLMgdkWOh7is1dnaB4+Aa3kuA8HWy
 bP3sYgp1anQSBiUCBTNAXgPEfO9r1QvxUiZTWXkWg5DZqI3Nc4iJ9E9S8DjmUZy5dueT
 UOrTnlUVaPVf+r9viGXkszmuoWJQpXrRxUXvIbsxklXwdqkNVD0O16BSlUR28/INWi/w
 4GxpuPzL6IjkctVdQE31E/vdSOmFrzWv8DBwqcNe8RsB/4J/UPzraFBh+C4vCwZUeQJr
 3Iaw==
X-Gm-Message-State: APjAAAXc9MlMY0V/Hx/io5cPMbqzKRDvrdmRFrVo9ilEg8ZiVpJJNlII
 IR0qsMkts/3gApH58Gpfq910My0n9ae45bsorH/acQ==
X-Google-Smtp-Source: APXvYqz8Ve5gTEe1GJWo8d+hmU7g5Xc1hhSGGDWsktmPt0CbWvIadFurW+S41A/AyyWjRjToxNxMLj9v6BgHAqXJmZU=
X-Received: by 2002:a65:590f:: with SMTP id f15mr20415804pgu.381.1575924772395; 
 Mon, 09 Dec 2019 12:52:52 -0800 (PST)
MIME-Version: 1.0
References: <20191209203230.1593-1-natechancellor@gmail.com>
In-Reply-To: <20191209203230.1593-1-natechancellor@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 9 Dec 2019 12:52:40 -0800
Message-ID: <CAKwvOdkeCCuYDWQFHitFczFX1-R1LjWoJ2gAfLuQAqvGz0ymPg@mail.gmail.com>
To: Nathan Chancellor <natechancellor@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=AvjOGQmItdmAy3vt51SLf/vsbTcB+aY7zT7fuJp4dP4=;
 b=BMWEse7d1vmm4hcRPwoeetEsOJYLiI4dgw9xLiplO0kcQPQGJTWcCySVk/dxpgEIjD
 aKuwxgkKhpRzsNinYeQ6WaeRPPQmSUj7TOmGQMOUgD+fgRMu6zW+lWsT1kEJAA8lbRZJ
 YRiyUsGtUoDgz4LdpMB563SEhOIhgoz0+7Kcc2aw6rUJp0mOgAPM5Q3WBm7i9sZsfiHW
 0sqil7OCE6YPGohvE/BdFR055EKas3ushjKPqXVqq8BjMOiavvdM0iDBkPajR8FSGpC4
 naLDsMfafXdYWwxdcVl6JR2dBsXK6xLG8XlXJaqxvUyWFtncztTKGy53J38WMbqh8i+a
 vQsw==
Subject: Re: [Freedreno] [PATCH] drm: msm: mdp4: Adjust indentation in
 mdp4_dsi_encoder_enable
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Rob Clark <robdclark@gmail.com>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gTW9uLCBEZWMgOSwgMjAxOSBhdCAxMjozMiBQTSBOYXRoYW4gQ2hhbmNlbGxvcgo8bmF0ZWNo
YW5jZWxsb3JAZ21haWwuY29tPiB3cm90ZToKPgo+IENsYW5nIHdhcm5zOgo+Cj4gLi4vZHJpdmVy
cy9ncHUvZHJtL21zbS9kaXNwL21kcDQvbWRwNF9kc2lfZW5jb2Rlci5jOjEyNDozOiB3YXJuaW5n
Ogo+IG1pc2xlYWRpbmcgaW5kZW50YXRpb247IHN0YXRlbWVudCBpcyBub3QgcGFydCBvZiB0aGUg
cHJldmlvdXMgJ2lmJwo+IFstV21pc2xlYWRpbmctaW5kZW50YXRpb25dCj4gICAgICAgICAgbWRw
NF9jcnRjX3NldF9jb25maWcoZW5jb2Rlci0+Y3J0YywKPiAgICAgICAgICBeCj4gLi4vZHJpdmVy
cy9ncHUvZHJtL21zbS9kaXNwL21kcDQvbWRwNF9kc2lfZW5jb2Rlci5jOjEyMToyOiBub3RlOgo+
IHByZXZpb3VzIHN0YXRlbWVudCBpcyBoZXJlCj4gICAgICAgICBpZiAobWRwNF9kc2lfZW5jb2Rl
ci0+ZW5hYmxlZCkKPiAgICAgICAgIF4KPgo+IFRoaXMgd2FybmluZyBvY2N1cnMgYmVjYXVzZSB0
aGVyZSBpcyBhIHNwYWNlIGFmdGVyIHRoZSB0YWIgb24gdGhpcyBsaW5lLgo+IFJlbW92ZSBpdCBz
byB0aGF0IHRoZSBpbmRlbnRhdGlvbiBpcyBjb25zaXN0ZW50IHdpdGggdGhlIExpbnV4IGtlcm5l
bAo+IGNvZGluZyBzdHlsZSBhbmQgY2xhbmcgbm8gbG9uZ2VyIHdhcm5zLgoKVGhhbmtzIGZvciB0
aGUgY2xlYW51cC4gTm90aGluZyB0byBzZWUgaGVyZSwgYnV0IHNob3VsZCBoZWxwIHVzIGZpbmQK
bW9yZSBpbnRlcmVzdGluZyBjYXNlcy4KUmV2aWV3ZWQtYnk6IE5pY2sgRGVzYXVsbmllcnMgPG5k
ZXNhdWxuaWVyc0Bnb29nbGUuY29tPgooSWYgdGhlcmUgYXJlIG90aGVyIGluc3RhbmNlcyBpbiBk
cml2ZXJzL2dwdS9kcm0vbXNtLCB0aGV5IHNob3VsZCBiZQpyb2xsZWQgdXAgaW50byB0aGlzIGNv
bW1pdCkKCj4KPiBGaXhlczogNzc2NjM4ZTczYTE5ICgiZHJtL21zbS9kc2k6IEFkZCBhIG1kcDQg
ZW5jb2RlciBmb3IgRFNJIikKPiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vQ2xhbmdCdWlsdExp
bnV4L2xpbnV4L2lzc3Vlcy83OTIKPiBTaWduZWQtb2ZmLWJ5OiBOYXRoYW4gQ2hhbmNlbGxvciA8
bmF0ZWNoYW5jZWxsb3JAZ21haWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rp
c3AvbWRwNC9tZHA0X2RzaV9lbmNvZGVyLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9tc20vZGlzcC9tZHA0L21kcDRfZHNpX2VuY29kZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20v
ZGlzcC9tZHA0L21kcDRfZHNpX2VuY29kZXIuYwo+IGluZGV4IDc3MmYwNzUzZWQzOC4uYWFmMmYy
NmY4NTA1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA0L21kcDRf
ZHNpX2VuY29kZXIuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA0L21kcDRf
ZHNpX2VuY29kZXIuYwo+IEBAIC0xMjEsNyArMTIxLDcgQEAgc3RhdGljIHZvaWQgbWRwNF9kc2lf
ZW5jb2Rlcl9lbmFibGUoc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyKQo+ICAgICAgICAgaWYg
KG1kcDRfZHNpX2VuY29kZXItPmVuYWJsZWQpCj4gICAgICAgICAgICAgICAgIHJldHVybjsKPgo+
IC0gICAgICAgIG1kcDRfY3J0Y19zZXRfY29uZmlnKGVuY29kZXItPmNydGMsCj4gKyAgICAgICBt
ZHA0X2NydGNfc2V0X2NvbmZpZyhlbmNvZGVyLT5jcnRjLAo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIE1EUDRfRE1BX0NPTkZJR19QQUNLX0FMSUdOX01TQiB8Cj4gICAgICAgICAgICAgICAgICAg
ICAgICAgTURQNF9ETUFfQ09ORklHX0RFRkxLUl9FTiB8Cj4gICAgICAgICAgICAgICAgICAgICAg
ICAgTURQNF9ETUFfQ09ORklHX0RJVEhFUl9FTiB8Cj4gLS0KPiAyLjI0LjAKPgo+IC0tCj4gWW91
IHJlY2VpdmVkIHRoaXMgbWVzc2FnZSBiZWNhdXNlIHlvdSBhcmUgc3Vic2NyaWJlZCB0byB0aGUg
R29vZ2xlIEdyb3VwcyAiQ2xhbmcgQnVpbHQgTGludXgiIGdyb3VwLgo+IFRvIHVuc3Vic2NyaWJl
IGZyb20gdGhpcyBncm91cCBhbmQgc3RvcCByZWNlaXZpbmcgZW1haWxzIGZyb20gaXQsIHNlbmQg
YW4gZW1haWwgdG8gY2xhbmctYnVpbHQtbGludXgrdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNv
bS4KPiBUbyB2aWV3IHRoaXMgZGlzY3Vzc2lvbiBvbiB0aGUgd2ViIHZpc2l0IGh0dHBzOi8vZ3Jv
dXBzLmdvb2dsZS5jb20vZC9tc2dpZC9jbGFuZy1idWlsdC1saW51eC8yMDE5MTIwOTIwMzIzMC4x
NTkzLTEtbmF0ZWNoYW5jZWxsb3IlNDBnbWFpbC5jb20uCgoKCi0tIApUaGFua3MsCn5OaWNrIERl
c2F1bG5pZXJzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==
