Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 527643D2FD2
	for <lists+freedreno@lfdr.de>; Fri, 23 Jul 2021 00:28:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF1506F4AE;
	Thu, 22 Jul 2021 22:28:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D7836F48E
 for <freedreno@lists.freedesktop.org>; Thu, 22 Jul 2021 22:28:03 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1626992883; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=K/DRu7ZbFRWkRW5sB/eRdjwaX6w7K6Rjm3k0kWJYiN4=;
 b=PhTG5hjcxlGudKsImH0BkSuj8gwHzPHWLku4x+4kV2uh0uQr2IYRPCOyJLHmjw+XqLnZqct6
 W3qQMer0GLuOqpx5aOiQxn6BtWGB4qTfrlQG4Pdx3mJQmz10HfzjQe27Fo1cZHA2TiH+FC6B
 6LjVHY0K3ezk292mh18Yw4Xv9Iw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60f9f0f2e81205dd0a6244f8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 22 Jul 2021 22:28:02
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8BD9FC4338A; Thu, 22 Jul 2021 22:28:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 35831C433D3;
 Thu, 22 Jul 2021 22:28:01 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 22 Jul 2021 15:28:01 -0700
From: khsieh@codeaurora.org
To: Lyude Paul <lyude@redhat.com>
In-Reply-To: <2da3949fa3504592da42c9d01dc060691c6a8b8b.camel@redhat.com>
References: <1625585434-9562-1-git-send-email-khsieh@codeaurora.org>
 <87zguy7c5a.fsf@intel.com> <a514c19f712a6feeddf854dc17cb8eb5@codeaurora.org>
 <2da3949fa3504592da42c9d01dc060691c6a8b8b.camel@redhat.com>
Message-ID: <d9ec812b4be57e32246735ca2f5e9560@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
Cc: mripard@kernel.org, rnayak@codeaurora.org, tzimmermann@suse.de,
 airlied@linux.ie, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org, swboyd@chromium.org,
 robdclark@gmail.com, Jani Nikula <jani.nikula@linux.intel.com>,
 daniel@ffwll.ch, aravindh@codeaurora.org, sean@poorly.run,
 rsubbia@codeaurora.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gMjAyMS0wNy0yMiAxMDo1MywgTHl1ZGUgUGF1bCB3cm90ZToKPiBPbiBUdWUsIDIwMjEtMDct
MTMgYXQgMTU6MjQgLTA3MDAsIGtoc2llaEBjb2RlYXVyb3JhLm9yZyB3cm90ZToKPj4gT24gMjAy
MS0wNy0wNyAwMTozNywgSmFuaSBOaWt1bGEgd3JvdGU6Cj4+ID4gT24gVHVlLCAwNiBKdWwgMjAy
MSwgS3VvZ2VlIEhzaWVoIDxraHNpZWhAY29kZWF1cm9yYS5vcmc+IHdyb3RlOgo+PiA+ID4gRnJv
bTogUmFqa3VtYXIgU3ViYmlhaCA8cnN1YmJpYUBjb2RlYXVyb3JhLm9yZz4KPj4gPiA+Cj4+ID4g
PiBDb21taXQgMmYwMTVlYzZlYWI2ICgiZHJtL2RwX21zdDogQWRkIHNpZGViYW5kIGRvd24gcmVx
dWVzdCB0cmFjaW5nICsKPj4gPiA+IHNlbGZ0ZXN0cyIpIGFkZGVkIHNvbWUgZGVidWcgY29kZSBm
b3Igc2lkZWJhbmQgbWVzc2FnZSB0cmFjaW5nLiBCdXQKPj4gPiA+IGl0IHNlZW1zIHRvIGhhdmUg
dW5pbnRlbnRpb25hbGx5IGNoYW5nZWQgdGhlIGJlaGF2aW9yIG9uIHNpZGViYW5kCj4+ID4gPiBt
ZXNzYWdlCj4+ID4gPiBmYWlsdXJlLiBJdCBjYXRjaGVzIGFuZCByZXR1cm5zIGZhaWx1cmUgb25s
eSBpZiBEUk1fVVRfRFAgaXMgZW5hYmxlZC4KPj4gPiA+IE90aGVyd2lzZSBpdCBpZ25vcmVzIHRo
ZSBlcnJvciBjb2RlIGFuZCByZXR1cm5zIHN1Y2Nlc3MuIFNvIG9uIGFuIE1TVAo+PiA+ID4gdW5w
bHVnLCB0aGUgY2FsbGVyIGlzIHVuYXdhcmUgdGhhdCB0aGUgY2xlYXIgcGF5bG9hZCBtZXNzYWdl
IGZhaWxlZAo+PiA+ID4gYW5kCj4+ID4gPiBlbmRzIHVwIHdhaXRpbmcgZm9yIDQgc2Vjb25kcyBm
b3IgdGhlIHJlc3BvbnNlLiBGaXhlcyB0aGUgaXNzdWUgYnkKPj4gPiA+IHJldHVybmluZyB0aGUg
cHJvcGVyIGVycm9yIGNvZGUuCj4+ID4gPgo+PiA+ID4gQ2hhbmdlcyBpbiBWMjoKPj4gPiA+IC0t
IFJldmlzZSBjb21taXQgdGV4dCBhcyByZXZpZXcgY29tbWVudAo+PiA+ID4gLS0gYWRkIEZpeGVz
IHRleHQKPj4gPiA+Cj4+ID4gPiBDaGFuZ2VzIGluIFYzOgo+PiA+ID4gLS0gcmVtb3ZlICJ1bmxp
a2VseSIgb3B0aW1pemF0aW9uCj4+ID4gPgo+PiA+ID4gRml4ZXM6IDJmMDE1ZWM2ZWFiNiAoImRy
bS9kcF9tc3Q6IEFkZCBzaWRlYmFuZCBkb3duIHJlcXVlc3QgdHJhY2luZyArCj4+ID4gPiBzZWxm
dGVzdHMiKQo+PiA+ID4KPj4gPiA+IFNpZ25lZC1vZmYtYnk6IFJhamt1bWFyIFN1YmJpYWggPHJz
dWJiaWFAY29kZWF1cm9yYS5vcmc+Cj4+ID4gPiBTaWduZWQtb2ZmLWJ5OiBLdW9nZWUgSHNpZWgg
PGtoc2llaEBjb2RlYXVyb3JhLm9yZz4KPj4gPiA+Cj4+ID4gPiBSZXZpZXdlZC1ieTogU3RlcGhl
biBCb3lkIDxzd2JveWRAY2hyb21pdW0ub3JnPgo+PiA+Cj4+ID4gUmV2aWV3ZWQtYnk6IEphbmkg
TmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+Cj4+ID4KPj4gPgo+PiA+ID4gLS0tCj4+IEx5
dWRlLAo+PiBBbnkgY29tbWVudHMgZnJvbSB5b3U/Cj4+IFRoYW5rcywKPiAKPiBIZXkhIFNvcnJ5
IGRpZCBJIGZvcmdldCB0byByZXNwb25kIHRvIHRoaXM/Cj4gCj4gUmV2aWV3ZWQtYnk6IEx5dWRl
IFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+Cj4gCgpJdCBsb29rcyBsaWtlIHRoaXMgcGF0Y2ggaXMg
Z29vZCB0byBnbyAobWFpbmxpbmVkKS4KQW55dGhpbmcgbmVlZGVkIGZyb20gbWUgdG8gZG8/ClRo
YW5rcywKCj4+IAo+PiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5j
IHwgMTAgKysrKysrLS0tLQo+PiA+ID4gwqAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQo+PiA+ID4KPj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBf
bXN0X3RvcG9sb2d5LmMKPj4gPiA+IGluZGV4IDE1OTAxNDQuLmRmOTExMTAgMTAwNjQ0Cj4+ID4g
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4+ID4gPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4+ID4gPiBAQCAtMjg4Nywx
MSArMjg4NywxMyBAQCBzdGF0aWMgaW50IHByb2Nlc3Nfc2luZ2xlX3R4X3Fsb2NrKHN0cnVjdAo+
PiA+ID4gZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1nciwKPj4gPiA+IMKgwqDCoMKgwqDCoMKg
wqBpZHggKz0gdG9zZW5kICsgMTsKPj4gPiA+Cj4+ID4gPiDCoMKgwqDCoMKgwqDCoMKgcmV0ID0g
ZHJtX2RwX3NlbmRfc2lkZWJhbmRfbXNnKG1nciwgdXAsIGNodW5rLCBpZHgpOwo+PiA+ID4gLcKg
wqDCoMKgwqDCoMKgaWYgKHVubGlrZWx5KHJldCkgJiYgZHJtX2RlYnVnX2VuYWJsZWQoRFJNX1VU
X0RQKSkgewo+PiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBkcm1f
cHJpbnRlciBwID0gZHJtX2RlYnVnX3ByaW50ZXIoREJHX1BSRUZJWCk7Cj4+ID4gPiArwqDCoMKg
wqDCoMKgwqBpZiAocmV0KSB7Cj4+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
aWYgKGRybV9kZWJ1Z19lbmFibGVkKERSTV9VVF9EUCkpIHsKPj4gPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IGRybV9wcmludGVyIHAgPQo+
PiA+ID4gZHJtX2RlYnVnX3ByaW50ZXIoREJHX1BSRUZJWCk7Cj4+ID4gPgo+PiA+ID4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRybV9wcmludGYoJnAsICJzaWRlYmFuZCBtc2cgZmFp
bGVkIHRvIHNlbmRcbiIpOwo+PiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRy
bV9kcF9tc3RfZHVtcF9zaWRlYmFuZF9tc2dfdHgoJnAsIHR4bXNnKTsKPj4gPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZHJtX3ByaW50ZigmcCwgInNp
ZGViYW5kIG1zZyBmYWlsZWQgdG8gc2VuZFxuIik7Cj4+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRybV9kcF9tc3RfZHVtcF9zaWRlYmFuZF9tc2df
dHgoJnAsIHR4bXNnKTsKPj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9Cj4+
ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiByZXQ7Cj4+ID4gPiDC
oMKgwqDCoMKgwqDCoMKgfQo+PiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZnJlZWRyZW5vCg==
