Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9E73B79F9
	for <lists+freedreno@lfdr.de>; Tue, 29 Jun 2021 23:38:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 757116E04A;
	Tue, 29 Jun 2021 21:38:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B9616E04A
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jun 2021 21:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625002702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=556hAVcxkakk3x66+sCCRkRCbnFq/lA0vFoRpZZIZRk=;
 b=SsgWnfQHhcXy/KQ5eO+rmJ8/bd87KkxMDqAYVAy/0tYeS9VLyulKgducSAaJvweY3i4iSA
 FRWv7IdcpuWtC9uz1SfST3/pBvl3A5RrH1DVGX8CKrct4r4mIq1GtbXJqhAgEniF7TzINY
 fkgzSlwSrX6p50xwE6JFAhENVEWaCs8=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-4jM5MoS3O2ycQlkDj8tNjw-1; Tue, 29 Jun 2021 17:38:20 -0400
X-MC-Unique: 4jM5MoS3O2ycQlkDj8tNjw-1
Received: by mail-qv1-f69.google.com with SMTP id
 ei5-20020ad45a050000b029027c5382c633so20357901qvb.3
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jun 2021 14:38:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=556hAVcxkakk3x66+sCCRkRCbnFq/lA0vFoRpZZIZRk=;
 b=XMX+Qsu8npn1oxRBa7onL4a2xxyU3ftVX/myyg2DTq5qSpWutegDGtLhqUWLfwIFq5
 SxBMh60hlzCNF723UJxGOy2tezzY2i6MJiQ+9iDDjzIi6Ax5Vp5m93quUH1Gi8QaaaxB
 Aur1kkPJ9pKB3fuh05u5me3daBmE+QGUpz2aIfATCkARCb6DXB04a2jclNJNkarG7tKe
 Z1V+mB1MpBdfqA3r16DX0PBa9tX8H9HFy+lQmZ2fhZAEHNMydGNru29MbuzSxHJa3iWc
 Ra7ZfSAONfIqUHWM5dJDPWzCTSzMBioSWPScbzztt1idx/o9ztreb/oBg7OcTovcJAf/
 5J2w==
X-Gm-Message-State: AOAM530sFPiK/V9sdjNIrZ8Ev6FaAcqBlZzF+6N76FmKz0Ni7i2LxMbM
 uCNAANNU/LkbQE65ywT+ShWXIgWTKA14gA6nV5c/w2HkR+85OOn43fksT3j7yJyITMFQ7Ce9A84
 q6HZK6WcW/fkkq3MlooyNWhEhUFRP
X-Received: by 2002:a05:620a:62e:: with SMTP id
 14mr23446256qkv.180.1625002700440; 
 Tue, 29 Jun 2021 14:38:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwh0LaLNSmT7YCUeuFj0ztZxSOcVXe4qks8kATy5bQNb++niof019SEITuHPzGZcc57m7Tavg==
X-Received: by 2002:a05:620a:62e:: with SMTP id
 14mr23446240qkv.180.1625002700239; 
 Tue, 29 Jun 2021 14:38:20 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id b188sm12497748qkf.133.2021.06.29.14.38.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 14:38:19 -0700 (PDT)
Message-ID: <d8e09114428307a029f31dc1a7da77e21f9b2b34.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh
 <khsieh@codeaurora.org>,  robdclark@gmail.com, sean@poorly.run
Date: Tue, 29 Jun 2021 17:38:17 -0400
In-Reply-To: <CAE-0n50onDrop=67VvMWL2sbSJedxhKEX13PsiZNaokucSgLew@mail.gmail.com>
References: <1624997336-2245-1-git-send-email-khsieh@codeaurora.org>
 <CAE-0n50onDrop=67VvMWL2sbSJedxhKEX13PsiZNaokucSgLew@mail.gmail.com>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Freedreno] [PATCH] drm/dp_mst: Fix return code on sideband
 message failure
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: rnayak@codeaurora.org, tzimmermann@suse.de, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org, mripard@kernel.org,
 daniel@ffwll.ch, aravindh@codeaurora.org, freedreno@lists.freedesktop.org,
 rsubbia@codeaurora.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

SkZZSSB0aGlzIGlzIG9uIG15IHJhZGFyIGFuZCBJJ2xsIHRha2UgYSBsb29rIGFzYXAKCk9uIFR1
ZSwgMjAyMS0wNi0yOSBhdCAxMzo0MSAtMDcwMCwgU3RlcGhlbiBCb3lkIHdyb3RlOgo+ICtMeXVk
ZSwgYXV0aG9yIG9mIGZpeGVkIGNvbW1pdC4gUGxlYXNlIGFkZCByZWxldmFudCBmb2xrcyBpbiB0
aGUgZnV0dXJlLgo+IAo+IFF1b3RpbmcgS3VvZ2VlIEhzaWVoICgyMDIxLTA2LTI5IDEzOjA4OjU2
KQo+ID4gRnJvbTogUmFqa3VtYXIgU3ViYmlhaCA8cnN1YmJpYUBjb2RlYXVyb3JhLm9yZz4KPiA+
IAo+ID4gVGhlIGNvbW1pdCAyZjAxNWVjNmVhYjY5MzAxZmRjZjU0ZDM5NzgxMGQ3MjM2MmQ3MjIz
IGFkZGVkIHNvbWUgZGVidWcKPiAKPiBQbGVhc2Ugd3JpdGUKPiAKPiBDb21taXQgMmYwMTVlYzZl
YWI2ICgiZHJtL2RwX21zdDogQWRkIHNpZGViYW5kIGRvd24gcmVxdWVzdCB0cmFjaW5nICsKPiBz
ZWxmdGVzdHMiKSBhZGRlZCBzb21lIGRlYnVnCj4gCj4gPiBjb2RlIGZvciBzaWRlYmFuZCBtZXNz
YWdlIHRyYWNpbmcuIEJ1dCBpdCBzZWVtcyB0byBoYXZlIHVuaW50ZW50aW9uYWxseQo+ID4gY2hh
bmdlZCB0aGUgYmVoYXZpb3Igb24gc2lkZWJhbmQgbWVzc2FnZSBmYWlsdXJlLiBJdCBjYXRjaGVz
IGFuZCByZXR1cm5zCj4gPiBmYWlsdXJlIG9ubHkgaWYgRFJNX1VUX0RQIGlzIGVuYWJsZWQuIE90
aGVyd2lzZSBpdCBpZ25vcmVzIHRoZSBlcnJvciBjb2RlCj4gPiBhbmQgcmV0dXJucyBzdWNjZXNz
LiBTbyBvbiBhbiBNU1QgdW5wbHVnLCB0aGUgY2FsbGVyIGlzIHVuYXdhcmUgdGhhdCB0aGUKPiA+
IGNsZWFyIHBheWxvYWQgbWVzc2FnZSBmYWlsZWQgYW5kIGVuZHMgdXAgd2FpdGluZyBmb3IgNCBz
ZWNvbmRzIGZvciB0aGUKPiA+IHJlc3BvbnNlLgo+ID4gCj4gPiBUaGlzIGNoYW5nZSBmaXhlcyB0
aGUgaXNzdWUgYnkgcmV0dXJuaW5nIHRoZSBwcm9wZXIgZXJyb3IgY29kZS4KPiAKPiAkIGdpdCBn
cmVwICJUaGlzIHBhdGNoIiAtLSBEb2N1bWVudGF0aW9uL3Byb2Nlc3MKPiAKPiA+IAo+ID4gQ2hh
bmdlLUlkOiBJMjg4N2I3Y2EyMTM1NWZlODRhNzk2OGY3NjE5ZDVlODE5OWNiYjBjNgo+IAo+IFBs
ZWFzZSByZXBsYWNlIHdpdGgKPiAKPiBGaXhlczogMmYwMTVlYzZlYWI2ICgiZHJtL2RwX21zdDog
QWRkIHNpZGViYW5kIGRvd24gcmVxdWVzdCB0cmFjaW5nICsKPiBzZWxmdGVzdHMiKQo+IAo+ID4g
U2lnbmVkLW9mZi1ieTogUmFqa3VtYXIgU3ViYmlhaCA8cnN1YmJpYUBjb2RlYXVyb3JhLm9yZz4K
PiAKPiBTaG91bGQgYmUgYSBTaWduZWQtb2ZmLWJ5IGZyb20gS3VvZ2VlIEhzaWVoIGhlcmUuCj4g
Cj4gPiAtLS0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYyB8IDEw
ICsrKysrKy0tLS0KPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0
X3RvcG9sb2d5LmMKPiA+IGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+
ID4gaW5kZXggMTU5MDE0NC4uOGQ5NzQzMCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBf
bXN0X3RvcG9sb2d5LmMKPiA+IEBAIC0yODg3LDExICsyODg3LDEzIEBAIHN0YXRpYyBpbnQgcHJv
Y2Vzc19zaW5nbGVfdHhfcWxvY2soc3RydWN0Cj4gPiBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAq
bWdyLAo+ID4gwqDCoMKgwqDCoMKgwqAgaWR4ICs9IHRvc2VuZCArIDE7Cj4gPiAKPiA+IMKgwqDC
oMKgwqDCoMKgIHJldCA9IGRybV9kcF9zZW5kX3NpZGViYW5kX21zZyhtZ3IsIHVwLCBjaHVuaywg
aWR4KTsKPiA+IC3CoMKgwqDCoMKgwqAgaWYgKHVubGlrZWx5KHJldCkgJiYgZHJtX2RlYnVnX2Vu
YWJsZWQoRFJNX1VUX0RQKSkgewo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3Ry
dWN0IGRybV9wcmludGVyIHAgPSBkcm1fZGVidWdfcHJpbnRlcihEQkdfUFJFRklYKTsKPiA+ICvC
oMKgwqDCoMKgwqAgaWYgKHVubGlrZWx5KHJldCkpIHsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGlmIChkcm1fZGVidWdfZW5hYmxlZChEUk1fVVRfRFApKSB7Cj4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGRybV9wcmludGVy
IHAgPQo+ID4gZHJtX2RlYnVnX3ByaW50ZXIoREJHX1BSRUZJWCk7Cj4gPiAKPiA+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRybV9wcmludGYoJnAsICJzaWRlYmFuZCBtc2cgZmFpbGVk
IHRvIHNlbmRcbiIpOwo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZHJtX2RwX21z
dF9kdW1wX3NpZGViYW5kX21zZ190eCgmcCwgdHhtc2cpOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRybV9wcmludGYoJnAsICJzaWRlYmFuZCBtc2cg
ZmFpbGVkIHRvIHNlbmRcbiIpOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGRybV9kcF9tc3RfZHVtcF9zaWRlYmFuZF9tc2dfdHgoJnAsIHR4bXNnKTsK
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPiA+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+ID4gwqDCoMKgwqDCoMKgwqAgfQo+ID4gCj4gCj4g
V2l0aCB0aGUgYWJvdmUgZml4ZWQgdXAKPiAKPiBSZXZpZXdlZC1ieTogU3RlcGhlbiBCb3lkIDxz
d2JveWRAY2hyb21pdW0ub3JnPgo+IAoKLS0gCkNoZWVycywKIEx5dWRlIFBhdWwgKHNoZS9oZXIp
CiBTb2Z0d2FyZSBFbmdpbmVlciBhdCBSZWQgSGF0CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpGcmVlZHJlbm8gbWFpbGluZyBsaXN0CkZyZWVkcmVub0Bs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9mcmVlZHJlbm8K
