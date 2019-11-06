Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1708F1CB5
	for <lists+freedreno@lfdr.de>; Wed,  6 Nov 2019 18:46:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A82B26E09F;
	Wed,  6 Nov 2019 17:46:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-xc44.google.com (mail-yw1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E5E6E09F
 for <freedreno@lists.freedesktop.org>; Wed,  6 Nov 2019 17:46:02 +0000 (UTC)
Received: by mail-yw1-xc44.google.com with SMTP id g77so9859935ywb.10
 for <freedreno@lists.freedesktop.org>; Wed, 06 Nov 2019 09:46:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ti2WIrG/wqVpP6gwSLMr10D1CGH87UGB79Iwp1jjWko=;
 b=qRU4f0ERmNRwwYfXRxz2ryGAXXyo90OZusSN93fWr33Um2jDzSgVdULbf79ABlsM0a
 OfpLYJeB51El22zttvSd1P1Y4GoGntMWbgD+ncyD2mzKQy2N3ikaKqYIdE3naFJriX9I
 dM/LTzdKFszghX7u9aBRjIoCK6zrgOYv3O4J1wwRugaZlTbnEJNGBQ/LZnPmxaV5pV4X
 QXLarEaYwA8UQPnpMEIwo2di9W7AeRJo3dtENnSrLY5QTv9Fp1OEO6CPbkRNf5raBW9m
 YR6KgAmWFypYAUIrMLCbqqpdo9mpE9/o13gFlfVqeh+Wo4clXaCy+w5C4LPiLhNViAnN
 CsxA==
X-Gm-Message-State: APjAAAWSusPQj3seowAFvg+hpOIPYcoafzGES6gvEP6zWbYjvSL4Unlx
 3/4yuXbkYHS+oIBWRkcG7uUE+Q==
X-Google-Smtp-Source: APXvYqx+E9tcHAdNQprtoLG2oNzLkUnhaDZUthibXbPbXDss3FV9KlCr/w+GU/N9UxBctOFYTUsCUw==
X-Received: by 2002:a81:7a52:: with SMTP id v79mr2598939ywc.254.1573062362106; 
 Wed, 06 Nov 2019 09:46:02 -0800 (PST)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id t7sm6670902ywe.19.2019.11.06.09.46.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 09:46:01 -0800 (PST)
Date: Wed, 6 Nov 2019 12:46:00 -0500
From: Sean Paul <sean@poorly.run>
To: Sharat Masetty <smasetty@codeaurora.org>
Message-ID: <20191106174600.GB63329@art_vandelay>
References: <1573040963-24148-1-git-send-email-smasetty@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1573040963-24148-1-git-send-email-smasetty@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ti2WIrG/wqVpP6gwSLMr10D1CGH87UGB79Iwp1jjWko=;
 b=IhxBw/0pqpQSQ9R7a5DrsROMdvGXM67XkxQ2UirspG3CCZcPw2VgEkhV4uhOHzsggD
 p2e6ztsXbDfECjlQazuurS8Ig1LCO5Yd+Z2ON8NxO23pQNsmafoj57jLxorJbr4KVwc2
 4l2ov/HkhF0TdQQ7Nphnxj2Oque1M5QzM+9lOL3ZbsxXhZMl+4noMvz2jeKbHPK5vGcP
 JJi4+xMB3I45K+plZysx4/nwu6Aum9+LFsfAl/2gWJISxN+3kJrz96a7Ns6teGzqnaKf
 fHuUaIxpB38o4QiIlD5AeSUmbS2X49uoWGZurbJ4uomVtAK2TMvUDcTqKPPlOGyBfXh7
 JAuw==
Subject: Re: [Freedreno] [PATCH] drm: msm: a6xx: fix debug bus register
 configuration
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMDYsIDIwMTkgYXQgMDU6MTk6MjNQTSArMDUzMCwgU2hhcmF0IE1hc2V0dHkg
d3JvdGU6Cj4gRml4IHRoZSBjeCBkZWJ1Z2J1cyByZWxhdGVkIHJlZ2lzdGVyIGNvbmZpZ3VyYXRp
b24sIHRvIGNvbGxlY3QgYWNjdXJhdGUKPiBidXMgZGF0YSBkdXJpbmcgZ3B1IHNuYXBzaG90LiBU
aGlzIGhlbHBzIHdpdGggY29tcGxldGUgc25hcHNob3QgZHVtcAo+IGFuZCBhbHNvIGNvbXBsZXRl
IHByb3BlciBHUFUgcmVjb3ZlcnkuCj4gCj4gU2lnbmVkLW9mZi1ieTogU2hhcmF0IE1hc2V0dHkg
PHNtYXNldHR5QGNvZGVhdXJvcmEub3JnPgoKQXBwbGllZCB0byBkcm0tbWlzYy1uZXh0LWZpeGVz
CgpUaGFua3MsCgpTZWFuCgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4
X2dwdV9zdGF0ZS5jIHwgMjQgKysrKysrKysrKysrLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxMiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9ncHVfc3RhdGUuYyBiL2RyaXZlcnMvZ3B1
L2RybS9tc20vYWRyZW5vL2E2eHhfZ3B1X3N0YXRlLmMKPiBpbmRleCA0ODNlMTAwLi5jNTc2NGI0
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ3B1X3N0YXRl
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dwdV9zdGF0ZS5jCj4g
QEAgLTM1MywyNiArMzUzLDI2IEBAIHN0YXRpYyB2b2lkIGE2eHhfZ2V0X2RlYnVnYnVzKHN0cnVj
dCBtc21fZ3B1ICpncHUsCj4gIAkJY3hkYmcgPSBpb3JlbWFwKHJlcy0+c3RhcnQsIHJlc291cmNl
X3NpemUocmVzKSk7Cj4gCj4gIAlpZiAoY3hkYmcpIHsKPiAtCQljeGRiZ193cml0ZShjeGRiZywg
UkVHX0E2WFhfREJHQ19DRkdfREJHQlVTX0NOVExULAo+ICsJCWN4ZGJnX3dyaXRlKGN4ZGJnLCBS
RUdfQTZYWF9DWF9EQkdDX0NGR19EQkdCVVNfQ05UTFQsCj4gIAkJCUE2WFhfREJHQ19DRkdfREJH
QlVTX0NOVExUX1NFR1QoMHhmKSk7Cj4gCj4gLQkJY3hkYmdfd3JpdGUoY3hkYmcsIFJFR19BNlhY
X0RCR0NfQ0ZHX0RCR0JVU19DTlRMTSwKPiArCQljeGRiZ193cml0ZShjeGRiZywgUkVHX0E2WFhf
Q1hfREJHQ19DRkdfREJHQlVTX0NOVExNLAo+ICAJCQlBNlhYX0RCR0NfQ0ZHX0RCR0JVU19DTlRM
TV9FTkFCTEUoMHhmKSk7Cj4gCj4gLQkJY3hkYmdfd3JpdGUoY3hkYmcsIFJFR19BNlhYX0RCR0Nf
Q0ZHX0RCR0JVU19JVlRMXzAsIDApOwo+IC0JCWN4ZGJnX3dyaXRlKGN4ZGJnLCBSRUdfQTZYWF9E
QkdDX0NGR19EQkdCVVNfSVZUTF8xLCAwKTsKPiAtCQljeGRiZ193cml0ZShjeGRiZywgUkVHX0E2
WFhfREJHQ19DRkdfREJHQlVTX0lWVExfMiwgMCk7Cj4gLQkJY3hkYmdfd3JpdGUoY3hkYmcsIFJF
R19BNlhYX0RCR0NfQ0ZHX0RCR0JVU19JVlRMXzMsIDApOwo+ICsJCWN4ZGJnX3dyaXRlKGN4ZGJn
LCBSRUdfQTZYWF9DWF9EQkdDX0NGR19EQkdCVVNfSVZUTF8wLCAwKTsKPiArCQljeGRiZ193cml0
ZShjeGRiZywgUkVHX0E2WFhfQ1hfREJHQ19DRkdfREJHQlVTX0lWVExfMSwgMCk7Cj4gKwkJY3hk
Ymdfd3JpdGUoY3hkYmcsIFJFR19BNlhYX0NYX0RCR0NfQ0ZHX0RCR0JVU19JVlRMXzIsIDApOwo+
ICsJCWN4ZGJnX3dyaXRlKGN4ZGJnLCBSRUdfQTZYWF9DWF9EQkdDX0NGR19EQkdCVVNfSVZUTF8z
LCAwKTsKPiAKPiAtCQljeGRiZ193cml0ZShjeGRiZywgUkVHX0E2WFhfREJHQ19DRkdfREJHQlVT
X0JZVEVMXzAsCj4gKwkJY3hkYmdfd3JpdGUoY3hkYmcsIFJFR19BNlhYX0NYX0RCR0NfQ0ZHX0RC
R0JVU19CWVRFTF8wLAo+ICAJCQkweDc2NTQzMjEwKTsKPiAtCQljeGRiZ193cml0ZShjeGRiZywg
UkVHX0E2WFhfREJHQ19DRkdfREJHQlVTX0JZVEVMXzEsCj4gKwkJY3hkYmdfd3JpdGUoY3hkYmcs
IFJFR19BNlhYX0NYX0RCR0NfQ0ZHX0RCR0JVU19CWVRFTF8xLAo+ICAJCQkweEZFRENCQTk4KTsK
PiAKPiAtCQljeGRiZ193cml0ZShjeGRiZywgUkVHX0E2WFhfREJHQ19DRkdfREJHQlVTX01BU0tM
XzAsIDApOwo+IC0JCWN4ZGJnX3dyaXRlKGN4ZGJnLCBSRUdfQTZYWF9EQkdDX0NGR19EQkdCVVNf
TUFTS0xfMSwgMCk7Cj4gLQkJY3hkYmdfd3JpdGUoY3hkYmcsIFJFR19BNlhYX0RCR0NfQ0ZHX0RC
R0JVU19NQVNLTF8yLCAwKTsKPiAtCQljeGRiZ193cml0ZShjeGRiZywgUkVHX0E2WFhfREJHQ19D
RkdfREJHQlVTX01BU0tMXzMsIDApOwo+ICsJCWN4ZGJnX3dyaXRlKGN4ZGJnLCBSRUdfQTZYWF9D
WF9EQkdDX0NGR19EQkdCVVNfTUFTS0xfMCwgMCk7Cj4gKwkJY3hkYmdfd3JpdGUoY3hkYmcsIFJF
R19BNlhYX0NYX0RCR0NfQ0ZHX0RCR0JVU19NQVNLTF8xLCAwKTsKPiArCQljeGRiZ193cml0ZShj
eGRiZywgUkVHX0E2WFhfQ1hfREJHQ19DRkdfREJHQlVTX01BU0tMXzIsIDApOwo+ICsJCWN4ZGJn
X3dyaXRlKGN4ZGJnLCBSRUdfQTZYWF9DWF9EQkdDX0NGR19EQkdCVVNfTUFTS0xfMywgMCk7Cj4g
IAl9Cj4gCj4gIAlucl9kZWJ1Z2J1c19ibG9ja3MgPSBBUlJBWV9TSVpFKGE2eHhfZGVidWdidXNf
YmxvY2tzKSArCj4gLS0KPiAxLjkuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gRnJlZWRyZW5vIG1haWxpbmcgbGlzdAo+IEZyZWVkcmVub0Bs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2ZyZWVkcmVubwoKLS0gClNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIs
IEdvb2dsZSAvIENocm9taXVtIE9TCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2ZyZWVkcmVubw==
