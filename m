Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7541C3BA472
	for <lists+freedreno@lfdr.de>; Fri,  2 Jul 2021 21:50:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2BA26E1F2;
	Fri,  2 Jul 2021 19:50:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DBA46E1F3
 for <freedreno@lists.freedesktop.org>; Fri,  2 Jul 2021 19:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625255447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=29SPvxPVQ0+aj9h4WhYrD9uwRhZ/3csk1qtrjUjwTJI=;
 b=TCNNh5BwSjvq9hTcNtgSKh2NB5uMdXCo+5xsQFbPZQwre6rBsqjYrOIlD5bmSozbyGpBSk
 aM3Y8xf/ZZAUZTVH06wgFYBFxX9NPlD6/YZ1i9gGzP4ZYYciQE6dn+72X93YJRKtsRkHDf
 /OJO3fuH+DTVG8JQJlmcwlgdiC5cKQk=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-l9k-5Ja9NNeh7kkU_klc7w-1; Fri, 02 Jul 2021 15:50:44 -0400
X-MC-Unique: l9k-5Ja9NNeh7kkU_klc7w-1
Received: by mail-qv1-f70.google.com with SMTP id
 ke6-20020a0562143006b029028b8546bb01so6905509qvb.20
 for <freedreno@lists.freedesktop.org>; Fri, 02 Jul 2021 12:50:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=29SPvxPVQ0+aj9h4WhYrD9uwRhZ/3csk1qtrjUjwTJI=;
 b=eaFajt+OceI09bFTxQ5GwwqfFsky2busS1mWf+GTDzMC4adpn9lICz1LSWP7IoubRB
 9yfMCFxsNRZ5j5P2xl3zscGbuCpa3LzZtHu7Uae+B4qPwD1U8qwz0j59PO/k1mDVIC6N
 m29/cXdqyL+C4mqEWCDw1bNBU1JvncGrN4XRyWbtV5q6wusi4czW0q3YryPHZk4a0Ifv
 zIhwN1Pb0iZwTMk73/ycgwZlgFTa5c2W8P+72tYNBMvA1zQTcH/OgEUrJWs79MTFKvSt
 jvmhVhIpBRu4Ie3IDWu9mj2uQUYTz8g9tOjJthM3OaQ4RjjIKIqFS8RpLdKCb9qCKDfD
 HTMQ==
X-Gm-Message-State: AOAM531Zl2G9aqO9sx5PX3YNyc1xOaFQwo4RApqLTV6Vl8Tp0rQx74YA
 L/3FLsC1mMK0O2Hf3jdijxd1IwAvJAcxIAarh24Ee3AxA1DMLFE9QJ3JGZAwzr/Ye/AWtMraefK
 CrFSNVMuEeBgshK9E0GiItYqR1Ish
X-Received: by 2002:ad4:5f8c:: with SMTP id jp12mr1086888qvb.37.1625255443907; 
 Fri, 02 Jul 2021 12:50:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxW/pFCKi5bwD15NnkBDOU0SdiHCeccT+EjQeuAb2xh34kiNOtKwHCq9x9h32qHxSz6gWx7IA==
X-Received: by 2002:ad4:5f8c:: with SMTP id jp12mr1086857qvb.37.1625255443708; 
 Fri, 02 Jul 2021 12:50:43 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id k8sm1853417qkj.46.2021.07.02.12.50.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 12:50:43 -0700 (PDT)
Message-ID: <ecd705dad88c4ea1331edc269f136aca4a5e63d5.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com,
 sean@poorly.run,  swboyd@chromium.org
Date: Fri, 02 Jul 2021 15:50:42 -0400
In-Reply-To: <1625008068-16458-1-git-send-email-khsieh@codeaurora.org>
References: <1625008068-16458-1-git-send-email-khsieh@codeaurora.org>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Freedreno] [PATCH v2] drm/dp_mst: Fix return code on sideband
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

SkZZSTogd2lsbCB0cnkgdG8gdGFrZSBhIGxvb2sgYXQgdGhpcyBhdCB0aGUgc3RhcnQgb2YgbmV4
dCB3ZWVrCgpPbiBUdWUsIDIwMjEtMDYtMjkgYXQgMTY6MDcgLTA3MDAsIEt1b2dlZSBIc2llaCB3
cm90ZToKPiBGcm9tOiBSYWprdW1hciBTdWJiaWFoIDxyc3ViYmlhQGNvZGVhdXJvcmEub3JnPgo+
IAo+IENvbW1pdCAyZjAxNWVjNmVhYjYgKCJkcm0vZHBfbXN0OiBBZGQgc2lkZWJhbmQgZG93biBy
ZXF1ZXN0IHRyYWNpbmcgKwo+IHNlbGZ0ZXN0cyIpIGFkZGVkIHNvbWUgZGVidWcgY29kZSBmb3Ig
c2lkZWJhbmQgbWVzc2FnZSB0cmFjaW5nLiBCdXQKPiBpdCBzZWVtcyB0byBoYXZlIHVuaW50ZW50
aW9uYWxseSBjaGFuZ2VkIHRoZSBiZWhhdmlvciBvbiBzaWRlYmFuZCBtZXNzYWdlCj4gZmFpbHVy
ZS4gSXQgY2F0Y2hlcyBhbmQgcmV0dXJucyBmYWlsdXJlIG9ubHkgaWYgRFJNX1VUX0RQIGlzIGVu
YWJsZWQuCj4gT3RoZXJ3aXNlIGl0IGlnbm9yZXMgdGhlIGVycm9yIGNvZGUgYW5kIHJldHVybnMg
c3VjY2Vzcy4gU28gb24gYW4gTVNUCj4gdW5wbHVnLCB0aGUgY2FsbGVyIGlzIHVuYXdhcmUgdGhh
dCB0aGUgY2xlYXIgcGF5bG9hZCBtZXNzYWdlIGZhaWxlZCBhbmQKPiBlbmRzIHVwIHdhaXRpbmcg
Zm9yIDQgc2Vjb25kcyBmb3IgdGhlIHJlc3BvbnNlLiBGaXhlcyB0aGUgaXNzdWUgYnkKPiByZXR1
cm5pbmcgdGhlIHByb3BlciBlcnJvciBjb2RlLgo+IAo+IENoYW5nZXMgaW4gVjI6Cj4gLS0gUmV2
aXNlIGNvbW1pdCB0ZXh0IGFzIHJldmlldyBjb21tZW50Cj4gLS0gYWRkIEZpeGVzIHRleHQKPiAK
PiBGaXhlczogMmYwMTVlYzZlYWI2ICgiZHJtL2RwX21zdDogQWRkIHNpZGViYW5kIGRvd24gcmVx
dWVzdCB0cmFjaW5nICsKPiBzZWxmdGVzdHMiKQo+IAo+IFNpZ25lZC1vZmYtYnk6IFJhamt1bWFy
IFN1YmJpYWggPHJzdWJiaWFAY29kZWF1cm9yYS5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogS3VvZ2Vl
IEhzaWVoIDxraHNpZWhAY29kZWF1cm9yYS5vcmc+Cj4gCj4gUmV2aWV3ZWQtYnk6IFN0ZXBoZW4g
Qm95ZCA8c3dib3lkQGNocm9taXVtLm9yZz4KPiAtLS0KPiDCoGRyaXZlcnMvZ3B1L2RybS9kcm1f
ZHBfbXN0X3RvcG9sb2d5LmMgfCAxMCArKysrKystLS0tCj4gwqAxIGZpbGUgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4gYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21z
dF90b3BvbG9neS5jCj4gaW5kZXggMTU5MDE0NC4uOGQ5NzQzMCAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+IEBAIC0yODg3LDExICsyODg3LDEzIEBAIHN0YXRpYyBp
bnQgcHJvY2Vzc19zaW5nbGVfdHhfcWxvY2soc3RydWN0Cj4gZHJtX2RwX21zdF90b3BvbG9neV9t
Z3IgKm1nciwKPiDCoMKgwqDCoMKgwqDCoMKgaWR4ICs9IHRvc2VuZCArIDE7Cj4gwqAKPiDCoMKg
wqDCoMKgwqDCoMKgcmV0ID0gZHJtX2RwX3NlbmRfc2lkZWJhbmRfbXNnKG1nciwgdXAsIGNodW5r
LCBpZHgpOwo+IC3CoMKgwqDCoMKgwqDCoGlmICh1bmxpa2VseShyZXQpICYmIGRybV9kZWJ1Z19l
bmFibGVkKERSTV9VVF9EUCkpIHsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3Ry
dWN0IGRybV9wcmludGVyIHAgPSBkcm1fZGVidWdfcHJpbnRlcihEQkdfUFJFRklYKTsKPiArwqDC
oMKgwqDCoMKgwqBpZiAodW5saWtlbHkocmV0KSkgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBpZiAoZHJtX2RlYnVnX2VuYWJsZWQoRFJNX1VUX0RQKSkgewo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IGRybV9wcmludGVyIHAg
PQo+IGRybV9kZWJ1Z19wcmludGVyKERCR19QUkVGSVgpOwo+IMKgCj4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGRybV9wcmludGYoJnAsICJzaWRlYmFuZCBtc2cgZmFpbGVkIHRvIHNl
bmRcbiIpOwo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkcm1fZHBfbXN0X2R1bXBf
c2lkZWJhbmRfbXNnX3R4KCZwLCB0eG1zZyk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBkcm1fcHJpbnRmKCZwLCAic2lkZWJhbmQgbXNnIGZhaWxlZCB0
byBzZW5kXG4iKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGRybV9kcF9tc3RfZHVtcF9zaWRlYmFuZF9tc2dfdHgoJnAsIHR4bXNnKTsKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgcmV0dXJuIHJldDsKPiDCoMKgwqDCoMKgwqDCoMKgfQo+IMKgCgotLSAKQ2hlZXJzLAogTHl1
ZGUgUGF1bCAoc2hlL2hlcikKIFNvZnR3YXJlIEVuZ2luZWVyIGF0IFJlZCBIYXQKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5n
IGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubwo=
