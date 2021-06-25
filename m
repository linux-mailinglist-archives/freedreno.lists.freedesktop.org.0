Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 967173B4765
	for <lists+freedreno@lfdr.de>; Fri, 25 Jun 2021 18:27:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 378456EDF4;
	Fri, 25 Jun 2021 16:27:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E4E56EE14
 for <freedreno@lists.freedesktop.org>; Fri, 25 Jun 2021 16:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624638433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U5o+qfP6GHLfIPfnq02TmNaEHiucEY8RMLS1UO4vZ+s=;
 b=D0zFbwKuAXBltJ0CyDOOPDCLkicehizQLEnbHUBFuHTgAv/L9kRECge7d4CL3q09IMIFtZ
 m19DHtSujYHf1Rgtwnh4bmKWWjmHRZjw0t4Totiasd4yH1iaFKJn8VXx8joY2XE2oDQP+/
 uVY838Uy9i+4A8SfKIZnMBetXMN0u8k=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-sHJ46WdCNRWGt8KL0R0iPQ-1; Fri, 25 Jun 2021 12:27:12 -0400
X-MC-Unique: sHJ46WdCNRWGt8KL0R0iPQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 y5-20020a37af050000b02903a9c3f8b89fso10431108qke.2
 for <freedreno@lists.freedesktop.org>; Fri, 25 Jun 2021 09:27:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=U5o+qfP6GHLfIPfnq02TmNaEHiucEY8RMLS1UO4vZ+s=;
 b=elbt19ipmooqVsFTNrcs0C9qo1M9GWnZUmIdF9PPHDIygO3bjY09bQ6IZ3pKL6y4Ib
 U0qJM3J9qasZiuUrhuLGB7dYrARvTrsUKmUDNG4mur1Q+uuVYBTbqa0JEU5KsRUUgxCO
 t+ne/9vfWc8nr4UPzT2pzWm+YReUTGh97ywz6z39ktF5OslzD6az9gn9KxgMSrqMEbYe
 iPMEBbj+QXpusz6XeQWTz0/PkDZbitQF4OGaabhCLxPTo2vTGSX1wbb7f7BsJOjZjWMs
 +BfFJq1VSgKEp7x2qJa2J8GqiQo7sbmrjnwCEewo3qW/sRSGtnCFYxI8gUo9gkceW8lr
 +ABw==
X-Gm-Message-State: AOAM532uvC8qurw6xsyfwGmD+Os1kPPhGmJxftReX6jdajGIAhxCi8rN
 1aNK3+cb6aL4hXUI3Obm8sKr5EKPtXsFDNd9qbDjAZSedJT16QAhb8vptF8KuGyVZM5q4DoR0/D
 SYzurqiueVn5yCKwmxavw/dzDfYaA
X-Received: by 2002:a0c:c3d1:: with SMTP id p17mr11777572qvi.44.1624638431614; 
 Fri, 25 Jun 2021 09:27:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNCXBo3wDqEwZBbeZJgLcThoweJoirnmT4pfoxXYsxbDiSqWO1f6DFrN67Lv8a1Xvc6DS5QA==
X-Received: by 2002:a0c:c3d1:: with SMTP id p17mr11777554qvi.44.1624638431416; 
 Fri, 25 Jun 2021 09:27:11 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id t62sm5240494qkc.26.2021.06.25.09.27.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 09:27:11 -0700 (PDT)
Message-ID: <a48763801f0e903a227283a12cf881dc143034ff.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Dave Airlie
 <airlied@redhat.com>
Date: Fri, 25 Jun 2021 12:27:09 -0400
In-Reply-To: <20210625034721.1287948-1-bjorn.andersson@linaro.org>
References: <20210625034721.1287948-1-bjorn.andersson@linaro.org>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: Add missing drm_device
 backpointer
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

QWggLSBtdXN0IGhhdmUgbWlzc2VkIHRoaXMgd2hlbiBJIGFkZGVkIHRoaXMuIFRoYW5rcyBmb3Ig
dGhlIGZpeCEKClJldmlld2VkLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgoKT24g
VGh1LCAyMDIxLTA2LTI0IGF0IDIwOjQ3IC0wNzAwLCBCam9ybiBBbmRlcnNzb24gd3JvdGU6Cj4g
JzZjYmEzZmU0MzM0MSAoImRybS9kcDogQWRkIGJhY2twb2ludGVyIHRvIGRybV9kZXZpY2UgaW4g
ZHJtX2RwX2F1eCIpJwo+IGludHJvZHVjZWQgYSBtYW5kYXRvciBkcm1fZGV2aWNlIGJhY2twb2lu
dGVyIGluIHN0cnVjdCBkcm1fZHBfYXV4LCBidXQKPiBtaXNzZWQgdGhlIG1zbSBEUCBkcml2ZXIu
IEZpeCB0aGlzLgo+IAo+IEZpeGVzOiA2Y2JhM2ZlNDMzNDEgKCJkcm0vZHA6IEFkZCBiYWNrcG9p
bnRlciB0byBkcm1fZGV2aWNlIGluIGRybV9kcF9hdXgiKQo+IFNpZ25lZC1vZmYtYnk6IEJqb3Ju
IEFuZGVyc3NvbiA8Ympvcm4uYW5kZXJzc29uQGxpbmFyby5vcmc+Cj4gLS0tCj4gwqBkcml2ZXJz
L2dwdS9kcm0vbXNtL2RwL2RwX2F1eC5jwqDCoMKgwqAgfCAzICsrLQo+IMKgZHJpdmVycy9ncHUv
ZHJtL21zbS9kcC9kcF9hdXguaMKgwqDCoMKgIHwgMiArLQo+IMKgZHJpdmVycy9ncHUvZHJtL21z
bS9kcC9kcF9kaXNwbGF5LmMgfCAyICstCj4gwqAzIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21z
bS9kcC9kcF9hdXguYwo+IGIvZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9hdXguYwo+IGluZGV4
IDRhMzI5M2I1OTBiMC4uODg2NTllZDIwMGI5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9tc20vZHAvZHBfYXV4LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2F1eC5j
Cj4gQEAgLTQ0MSw3ICs0NDEsNyBAQCB2b2lkIGRwX2F1eF9kZWluaXQoc3RydWN0IGRybV9kcF9h
dXggKmRwX2F1eCkKPiDCoMKgwqDCoMKgwqDCoMKgZHBfY2F0YWxvZ19hdXhfZW5hYmxlKGF1eC0+
Y2F0YWxvZywgZmFsc2UpOwo+IMKgfQo+IMKgCj4gLWludCBkcF9hdXhfcmVnaXN0ZXIoc3RydWN0
IGRybV9kcF9hdXggKmRwX2F1eCkKPiAraW50IGRwX2F1eF9yZWdpc3RlcihzdHJ1Y3QgZHJtX2Rw
X2F1eCAqZHBfYXV4LCBzdHJ1Y3QgZHJtX2RldmljZSAqZHJtX2RldikKPiDCoHsKPiDCoMKgwqDC
oMKgwqDCoMKgc3RydWN0IGRwX2F1eF9wcml2YXRlICphdXg7Cj4gwqDCoMKgwqDCoMKgwqDCoGlu
dCByZXQ7Cj4gQEAgLTQ1NSw2ICs0NTUsNyBAQCBpbnQgZHBfYXV4X3JlZ2lzdGVyKHN0cnVjdCBk
cm1fZHBfYXV4ICpkcF9hdXgpCj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgYXV4LT5kcF9hdXgubmFt
ZSA9ICJkcHVfZHBfYXV4IjsKPiDCoMKgwqDCoMKgwqDCoMKgYXV4LT5kcF9hdXguZGV2ID0gYXV4
LT5kZXY7Cj4gK8KgwqDCoMKgwqDCoMKgYXV4LT5kcF9hdXguZHJtX2RldiA9IGRybV9kZXY7Cj4g
wqDCoMKgwqDCoMKgwqDCoGF1eC0+ZHBfYXV4LnRyYW5zZmVyID0gZHBfYXV4X3RyYW5zZmVyOwo+
IMKgwqDCoMKgwqDCoMKgwqByZXQgPSBkcm1fZHBfYXV4X3JlZ2lzdGVyKCZhdXgtPmRwX2F1eCk7
Cj4gwqDCoMKgwqDCoMKgwqDCoGlmIChyZXQpIHsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL21zbS9kcC9kcF9hdXguaAo+IGIvZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9hdXguaAo+
IGluZGV4IDA3MjhjYzA5YzllYy4uN2VmMGQ4M2I0ODNhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9tc20vZHAvZHBfYXV4LmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2Rw
X2F1eC5oCj4gQEAgLTksNyArOSw3IEBACj4gwqAjaW5jbHVkZSAiZHBfY2F0YWxvZy5oIgo+IMKg
I2luY2x1ZGUgPGRybS9kcm1fZHBfaGVscGVyLmg+Cj4gwqAKPiAtaW50IGRwX2F1eF9yZWdpc3Rl
cihzdHJ1Y3QgZHJtX2RwX2F1eCAqZHBfYXV4KTsKPiAraW50IGRwX2F1eF9yZWdpc3RlcihzdHJ1
Y3QgZHJtX2RwX2F1eCAqZHBfYXV4LCBzdHJ1Y3QgZHJtX2RldmljZSAqZHJtX2Rldik7Cj4gwqB2
b2lkIGRwX2F1eF91bnJlZ2lzdGVyKHN0cnVjdCBkcm1fZHBfYXV4ICpkcF9hdXgpOwo+IMKgdm9p
ZCBkcF9hdXhfaXNyKHN0cnVjdCBkcm1fZHBfYXV4ICpkcF9hdXgpOwo+IMKgdm9pZCBkcF9hdXhf
aW5pdChzdHJ1Y3QgZHJtX2RwX2F1eCAqZHBfYXV4KTsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL21zbS9kcC9kcF9kaXNwbGF5LmMKPiBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBf
ZGlzcGxheS5jCj4gaW5kZXggYzI2NTYyYmQ4NWZlLi4yZjBhNWMxM2YyNTEgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9kaXNwbGF5LmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vbXNtL2RwL2RwX2Rpc3BsYXkuYwo+IEBAIC0yNTksNyArMjU5LDcgQEAgc3RhdGljIGlu
dCBkcF9kaXNwbGF5X2JpbmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QKPiBkZXZpY2UgKm1h
c3RlciwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiByYzsKPiDCoMKg
wqDCoMKgwqDCoMKgfQo+IMKgCj4gLcKgwqDCoMKgwqDCoMKgcmMgPSBkcF9hdXhfcmVnaXN0ZXIo
ZHAtPmF1eCk7Cj4gK8KgwqDCoMKgwqDCoMKgcmMgPSBkcF9hdXhfcmVnaXN0ZXIoZHAtPmF1eCwg
ZHJtKTsKPiDCoMKgwqDCoMKgwqDCoMKgaWYgKHJjKSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBEUk1fRVJST1IoIkRSTSBEUCBBVVggcmVnaXN0ZXIgZmFpbGVkXG4iKTsKPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiByYzsKCi0tIApDaGVlcnMsCiBM
eXVkZSBQYXVsIChzaGUvaGVyKQogU29mdHdhcmUgRW5naW5lZXIgYXQgUmVkIEhhdAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KRnJlZWRyZW5vIG1haWxp
bmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5vCg==
