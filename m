Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBDD3D2B76
	for <lists+freedreno@lfdr.de>; Thu, 22 Jul 2021 19:53:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 012F56E971;
	Thu, 22 Jul 2021 17:53:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 860F288A56
 for <freedreno@lists.freedesktop.org>; Thu, 22 Jul 2021 17:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626976418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y2GEg8okcVMAYnKdKmQC+g9S6ixUz1NHqQ1kjsCY4C0=;
 b=fJft5StI+AV3ERKShins3h17g5azGVRiT2IznUIBe8yvs0qrlABcud/8rAm/WYgtsizKPB
 yBzk9Pn+ffr3waxSC3i5fOFnE5PYiYCYYIQ84zK2Mv6Du1WgMOxXtzRTcbIdb2QTGdeAYc
 lJhl3qaoAa7IWDVI8I4JsKaIee6HDpg=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-WsvwPVDXNsam249UQOFjJg-1; Thu, 22 Jul 2021 13:53:37 -0400
X-MC-Unique: WsvwPVDXNsam249UQOFjJg-1
Received: by mail-qk1-f200.google.com with SMTP id
 k12-20020a05620a414cb02903b9ade0af31so4075539qko.1
 for <freedreno@lists.freedesktop.org>; Thu, 22 Jul 2021 10:53:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=Y2GEg8okcVMAYnKdKmQC+g9S6ixUz1NHqQ1kjsCY4C0=;
 b=ujpMRyUy0gwBB90nejr4pdWMfndFtC0G6NQySSW9nppRSJy4mkEJo9wcg57fWsv5aZ
 TtMZYMCvDdE1Sq2trXg5JY23JlKuOiG96VZgSC4nzA7dWLKdXc0MXoUoKFwNkQs6rekT
 xu9JmmuFN1K6SSXoqk5cWnDpTX+B3oFVb9Zxu6D+raSbjNlgHeci2uUk1kppS9ANtVtG
 NV+FaM2808NQ/0N4crYK1z/UbyHKjnifglL3/vG2heRZyiP7bZe5QTnL6atI9N0+I4jz
 zVfwzRhDeVrKOsR32S9Kpbfek3/p1tGgIpTfyfbUrTraff/KYZsOhCKG9RdyPjEbRtHJ
 y8eA==
X-Gm-Message-State: AOAM530eZkWAy/2UfwFB/ojq2DnlW5Zs290IASC2KuIPLmPR5IrVlVTX
 0qkh5TOePXvOW7TudAGEQ0bMviKOO20YxhWnP4vrE69tFHhWuZhzy8hu7E2g0MBMPN2j218xDj1
 +C08RqCfasNLNwxTfHGDN5SKy6YVi
X-Received: by 2002:a05:6214:129:: with SMTP id w9mr824710qvs.13.1626976416774; 
 Thu, 22 Jul 2021 10:53:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIX3vEtdM0CCkt3/yc6zqizr4OQmJT/HqF+o8uo7lMAGVHdyTFMumcqgcTkFv0yWCssyBNqw==
X-Received: by 2002:a05:6214:129:: with SMTP id w9mr824673qvs.13.1626976416543; 
 Thu, 22 Jul 2021 10:53:36 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id s19sm7294756qtx.5.2021.07.22.10.53.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 10:53:36 -0700 (PDT)
Message-ID: <2da3949fa3504592da42c9d01dc060691c6a8b8b.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: khsieh@codeaurora.org, Jani Nikula <jani.nikula@linux.intel.com>
Date: Thu, 22 Jul 2021 13:53:34 -0400
In-Reply-To: <a514c19f712a6feeddf854dc17cb8eb5@codeaurora.org>
References: <1625585434-9562-1-git-send-email-khsieh@codeaurora.org>
 <87zguy7c5a.fsf@intel.com>
 <a514c19f712a6feeddf854dc17cb8eb5@codeaurora.org>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Freedreno] [PATCH v3] drm/dp_mst: Fix return code on sideband
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
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, swboyd@chromium.org, robdclark@gmail.com,
 mripard@kernel.org, daniel@ffwll.ch, aravindh@codeaurora.org, sean@poorly.run,
 rsubbia@codeaurora.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIxLTA3LTEzIGF0IDE1OjI0IC0wNzAwLCBraHNpZWhAY29kZWF1cm9yYS5vcmcg
d3JvdGU6Cj4gT24gMjAyMS0wNy0wNyAwMTozNywgSmFuaSBOaWt1bGEgd3JvdGU6Cj4gPiBPbiBU
dWUsIDA2IEp1bCAyMDIxLCBLdW9nZWUgSHNpZWggPGtoc2llaEBjb2RlYXVyb3JhLm9yZz4gd3Jv
dGU6Cj4gPiA+IEZyb206IFJhamt1bWFyIFN1YmJpYWggPHJzdWJiaWFAY29kZWF1cm9yYS5vcmc+
Cj4gPiA+IAo+ID4gPiBDb21taXQgMmYwMTVlYzZlYWI2ICgiZHJtL2RwX21zdDogQWRkIHNpZGVi
YW5kIGRvd24gcmVxdWVzdCB0cmFjaW5nICsKPiA+ID4gc2VsZnRlc3RzIikgYWRkZWQgc29tZSBk
ZWJ1ZyBjb2RlIGZvciBzaWRlYmFuZCBtZXNzYWdlIHRyYWNpbmcuIEJ1dAo+ID4gPiBpdCBzZWVt
cyB0byBoYXZlIHVuaW50ZW50aW9uYWxseSBjaGFuZ2VkIHRoZSBiZWhhdmlvciBvbiBzaWRlYmFu
ZCAKPiA+ID4gbWVzc2FnZQo+ID4gPiBmYWlsdXJlLiBJdCBjYXRjaGVzIGFuZCByZXR1cm5zIGZh
aWx1cmUgb25seSBpZiBEUk1fVVRfRFAgaXMgZW5hYmxlZC4KPiA+ID4gT3RoZXJ3aXNlIGl0IGln
bm9yZXMgdGhlIGVycm9yIGNvZGUgYW5kIHJldHVybnMgc3VjY2Vzcy4gU28gb24gYW4gTVNUCj4g
PiA+IHVucGx1ZywgdGhlIGNhbGxlciBpcyB1bmF3YXJlIHRoYXQgdGhlIGNsZWFyIHBheWxvYWQg
bWVzc2FnZSBmYWlsZWQgCj4gPiA+IGFuZAo+ID4gPiBlbmRzIHVwIHdhaXRpbmcgZm9yIDQgc2Vj
b25kcyBmb3IgdGhlIHJlc3BvbnNlLiBGaXhlcyB0aGUgaXNzdWUgYnkKPiA+ID4gcmV0dXJuaW5n
IHRoZSBwcm9wZXIgZXJyb3IgY29kZS4KPiA+ID4gCj4gPiA+IENoYW5nZXMgaW4gVjI6Cj4gPiA+
IC0tIFJldmlzZSBjb21taXQgdGV4dCBhcyByZXZpZXcgY29tbWVudAo+ID4gPiAtLSBhZGQgRml4
ZXMgdGV4dAo+ID4gPiAKPiA+ID4gQ2hhbmdlcyBpbiBWMzoKPiA+ID4gLS0gcmVtb3ZlICJ1bmxp
a2VseSIgb3B0aW1pemF0aW9uCj4gPiA+IAo+ID4gPiBGaXhlczogMmYwMTVlYzZlYWI2ICgiZHJt
L2RwX21zdDogQWRkIHNpZGViYW5kIGRvd24gcmVxdWVzdCB0cmFjaW5nICsgCj4gPiA+IHNlbGZ0
ZXN0cyIpCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBSYWprdW1hciBTdWJiaWFoIDxyc3Vi
YmlhQGNvZGVhdXJvcmEub3JnPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBLdW9nZWUgSHNpZWggPGto
c2llaEBjb2RlYXVyb3JhLm9yZz4KPiA+ID4gCj4gPiA+IFJldmlld2VkLWJ5OiBTdGVwaGVuIEJv
eWQgPHN3Ym95ZEBjaHJvbWl1bS5vcmc+Cj4gPiAKPiA+IFJldmlld2VkLWJ5OiBKYW5pIE5pa3Vs
YSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgo+ID4gCj4gPiAKPiA+ID4gLS0tCj4gTHl1ZGUsCj4g
QW55IGNvbW1lbnRzIGZyb20geW91Pwo+IFRoYW5rcywKCkhleSEgU29ycnkgZGlkIEkgZm9yZ2V0
IHRvIHJlc3BvbmQgdG8gdGhpcz8KClJldmlld2VkLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRo
YXQuY29tPgoKPiAKPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5j
IHwgMTAgKysrKysrLS0tLQo+ID4gPiDCoDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCj4gPiA+IAo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2RybV9kcF9tc3RfdG9wb2xvZ3kuYyAKPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21z
dF90b3BvbG9neS5jCj4gPiA+IGluZGV4IDE1OTAxNDQuLmRmOTExMTAgMTAwNjQ0Cj4gPiA+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKPiA+ID4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+ID4gPiBAQCAtMjg4NywxMSArMjg4
NywxMyBAQCBzdGF0aWMgaW50IHByb2Nlc3Nfc2luZ2xlX3R4X3Fsb2NrKHN0cnVjdCAKPiA+ID4g
ZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1nciwKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoGlkeCAr
PSB0b3NlbmQgKyAxOwo+ID4gPiAKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoHJldCA9IGRybV9kcF9z
ZW5kX3NpZGViYW5kX21zZyhtZ3IsIHVwLCBjaHVuaywgaWR4KTsKPiA+ID4gLcKgwqDCoMKgwqDC
oMKgaWYgKHVubGlrZWx5KHJldCkgJiYgZHJtX2RlYnVnX2VuYWJsZWQoRFJNX1VUX0RQKSkgewo+
ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IGRybV9wcmludGVyIHAg
PSBkcm1fZGVidWdfcHJpbnRlcihEQkdfUFJFRklYKTsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgaWYg
KHJldCkgewo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKGRybV9kZWJ1
Z19lbmFibGVkKERSTV9VVF9EUCkpIHsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZHJtX3ByaW50ZXIgcCA9Cj4gPiA+IGRybV9kZWJ1
Z19wcmludGVyKERCR19QUkVGSVgpOwo+ID4gPiAKPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGRybV9wcmludGYoJnAsICJzaWRlYmFuZCBtc2cgZmFpbGVkIHRvIHNlbmRcbiIp
Owo+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZHJtX2RwX21zdF9kdW1wX3Np
ZGViYW5kX21zZ190eCgmcCwgdHhtc2cpOwo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRybV9wcmludGYoJnAsICJzaWRlYmFuZCBtc2cgZmFpbGVk
IHRvIHNlbmRcbiIpOwo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGRybV9kcF9tc3RfZHVtcF9zaWRlYmFuZF9tc2dfdHgoJnAsIHR4bXNnKTsKPiA+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0KPiA+ID4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gcmV0Owo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgfQo+IAoK
LS0gCkNoZWVycywKIEx5dWRlIFBhdWwgKHNoZS9oZXIpCiBTb2Z0d2FyZSBFbmdpbmVlciBhdCBS
ZWQgSGF0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpG
cmVlZHJlbm8gbWFpbGluZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJlbm8K
