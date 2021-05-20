Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B5138B0E1
	for <lists+freedreno@lfdr.de>; Thu, 20 May 2021 16:03:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B186E332;
	Thu, 20 May 2021 14:03:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31FB96E328;
 Thu, 20 May 2021 14:03:29 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id y14so15721802wrm.13;
 Thu, 20 May 2021 07:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wWjeE0yDrv2UVFU4YoPSFaA0vhNUTHMUSkW7tAm+lZs=;
 b=ha7DmMKmstTm/IDxLEPXsbLzHyWMhRnVBCfrz51luXRcG4CKj9+G9h0k0C8hd+9yS/
 ImcveRVof+ngVFu9eHMBpwMFjz3IYHSnTGB1B27R9Oi4Q5evsD9+XH7khVCSZ8Nn6udI
 UbPXRTi9Nf2kcoXX2Mz1mEAVk44H4TgHTAjPo1GYJ4kNQAwPKQr1Jycbu8VqaeyXhzPd
 7mWwEUR6AzTVpOqaw7o7O/bcLium6UuGw3PGO2OWaZGqY2zUCuYLyTuXbEjXam5CuX0g
 l0Lx2dGU04NXm/PvcmRarNEEdxyfj4UxxfFTLs6/ljeSaojFzMnZabLJHT3khgcF7Q4R
 CuaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wWjeE0yDrv2UVFU4YoPSFaA0vhNUTHMUSkW7tAm+lZs=;
 b=VMbZoUi/C7fP7QwA/zZ5GHcGhjbMSyylCqooyrgOq9nyZrL/KjAAxUPRgu1rED6ctg
 2H9oekJ0tgzwIvWErodkzX9u6Y2SSQUV+Ck+txQI5hGa7yU8VR1rHAm/CEuPXk+sBnvb
 ykaYsyK+iBMS22wVc5VvK/T/OO7H9zD9otiMmKYvpRMKdIANz7pK35AQVrrgzFTxTSeQ
 2DoaH06qLdATmzpc8woeWVMeSOssxa+AsTNRmr6/F3gzujJMPZaDQE1BVT2YFrZ2t2QI
 AnQyuu3Y2ZnkLK3yvqnmDf4Oiuf0ms6/2DOHF0CPV25Hut8XtEY+1qrf6zxOPRFHJX4B
 LGsQ==
X-Gm-Message-State: AOAM532kJOqL4PQL5VWYbIwFzOwrnw86IAh4ZQRce80D8cOP5AhhJ3Oi
 d2byATJWcXSm3pcDlLUuSlS9B7nStDRCw1N8Jo4=
X-Google-Smtp-Source: ABdhPJxjXALW1vMWjwAXW/Cmm+rVRo5vX07MNVEQRUVTn8pdBE2VaStNbfqIkw0AI2cjwAl8vCb+jPm5+0sn+geLWPQ=
X-Received: by 2002:adf:fa46:: with SMTP id y6mr4570532wrr.83.1621519407880;
 Thu, 20 May 2021 07:03:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210519183855.1523927-1-robdclark@gmail.com>
 <20210519183855.1523927-2-robdclark@gmail.com>
 <8dcdc8d5-176c-f0ad-0d54-6466e9e68a0a@amd.com>
In-Reply-To: <8dcdc8d5-176c-f0ad-0d54-6466e9e68a0a@amd.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 20 May 2021 07:07:10 -0700
Message-ID: <CAF6AEGtg_VnxYrj94AfbAfViK1v8U0ZJyfJjS4taVLMF=YVy+w@mail.gmail.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Subject: Re: [Freedreno] [RFC 1/3] dma-fence: Add boost fence op
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
Cc: Rob Clark <robdclark@chromium.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMTksIDIwMjEgYXQgMTE6NDcgUE0gQ2hyaXN0aWFuIEvDtm5pZwo8Y2hyaXN0
aWFuLmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+IFVmZiwgdGhhdCBsb29rcyB2ZXJ5IGhhcmR3
YXJlIHNwZWNpZmljIHRvIG1lLgoKSG93c28/ICBJJ20gbm90IHN1cmUgSSBhZ3JlZS4uIGFuZCBl
dmVuIGlmIGl0IHdhcyBub3QgdXNlZnVsIGZvciBzb21lCmh3LCBpdCBzaG91bGQgYmUgdXNlZnVs
IGZvciBlbm91Z2ggZHJpdmVycyAoYW5kIGhhcm0gbm8gZHJpdmVycyksIHNvIEkKc3RpbGwgdGhp
bmsgaXQgaXMgYSBnb29kIGlkZWEKClRoZSBmYWxsYmFjayBwbGFuIGlzIHRvIGdvIHRoZSBpOTE1
IHJvdXRlIGFuZCBzdG9wIHVzaW5nIGF0b21pYwpoZWxwZXJzIGFuZCBkbyB0aGUgc2FtZSB0aGlu
ZyBpbnNpZGUgdGhlIGRyaXZlciwgYnV0IHRoYXQgZG9lc24ndCBoZWxwCmFueSBvZiB0aGUgY2Fz
ZXMgd2hlcmUgeW91IGhhdmUgYSBzZXBhcmF0ZSBrbXMgYW5kIGdwdSBkcml2ZXIuCgo+IEFzIGZh
ciBhcyBJIGNhbiBzZWUgeW91IGNhbiBhbHNvIGltcGxlbWVudCBjb21wbGV0ZWx5IGluc2lkZSB0
aGUgYmFja2VuZAo+IGJ5IHN0YXJ0aW5nIGEgdGltZXIgb24gZW5hYmxlX3NpZ25hbGluZywgZG9u
J3QgeW91PwoKTm90IHJlYWxseS4uIEkgbWVhbiwgdGhlIGZhY3QgdGhhdCBzb21ldGhpbmcgd2Fp
dGVkIG9uIGEgZmVuY2UgY291bGQKYmUgYSB1c2VmdWwgaW5wdXQgc2lnbmFsIHRvIGdwdSBmcmVx
IGdvdmVybm9yLCBidXQgaXQgaXMgZW50aXJlbHkKaW5zdWZmaWNpZW50Li4KCklmIHRoZSBjcHUg
aXMgc3BlbmRpbmcgYSBsb3Qgb2YgdGltZSB3YWl0aW5nIG9uIGEgZmVuY2UsIGNwdWZyZXEgd2ls
bApjbG9jayBkb3duIHNvIHlvdSBzcGVuZCBsZXNzIHRpbWUgd2FpdGluZy4gIEFuZCBubyBwcm9i
bGVtIGhhcyBiZWVuCnNvbHZlZC4gIFlvdSBhYnNvbHV0ZWx5IG5lZWQgdGhlIGNvbmNlcHQgb2Yg
YSBtaXNzZWQgZGVhZGxpbmUsIGFuZCBhCnRpbWVyIGRvZXNuJ3QgZ2l2ZSB5b3UgdGhhdC4KCkJS
LAotUgoKPiBDaHJpc3RpYW4uCj4KPiBBbSAxOS4wNS4yMSB1bSAyMDozOCBzY2hyaWViIFJvYiBD
bGFyazoKPiA+IEZyb206IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KPiA+Cj4g
PiBBZGQgYSB3YXkgdG8gaGludCB0byB0aGUgZmVuY2Ugc2lnbmFsZXIgdGhhdCBhIGZlbmNlIHdh
aXRlciBoYXMgbWlzc2VkIGEKPiA+IGRlYWRsaW5lIHdhaXRpbmcgb24gdGhlIGZlbmNlLgo+ID4K
PiA+IEluIHNvbWUgY2FzZXMsIG1pc3NpbmcgYSB2YmxhbmsgY2FuIHJlc3VsdCBpbiBsb3dlciBn
cHUgdXRpbGl6YXRpb24sCj4gPiB3aGVuIHJlYWxseSB3ZSB3YW50IHRvIGdvIGluIHRoZSBvcHBv
c2l0ZSBkaXJlY3Rpb24gYW5kIGJvb3N0IGdwdSBmcmVxLgo+ID4gVGhlIGJvb3N0IGNhbGxiYWNr
IGdpdmVzIHNvbWUgZmVlZGJhY2sgdG8gdGhlIGZlbmNlIHNpZ25hbGVyIHRoYXQgd2UKPiA+IGFy
ZSBtaXNzaW5nIGRlYWRsaW5lcywgc28gaXQgY2FuIHRha2UgdGhpcyBpbnRvIGFjY291bnQgaW4g
aXQncyBmcmVxLwo+ID4gdXRpbGl6YXRpb24gY2FsY3VsYXRpb25zLgo+ID4KPiA+IFNpZ25lZC1v
ZmYtYnk6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KPiA+IC0tLQo+ID4gICBp
bmNsdWRlL2xpbnV4L2RtYS1mZW5jZS5oIHwgMjYgKysrKysrKysrKysrKysrKysrKysrKysrKysK
PiA+ICAgMSBmaWxlIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9saW51eC9kbWEtZmVuY2UuaCBiL2luY2x1ZGUvbGludXgvZG1hLWZlbmNlLmgK
PiA+IGluZGV4IDlmMTJlZmFhYTkzYS4uMTcyNzAyNTIxYWNjIDEwMDY0NAo+ID4gLS0tIGEvaW5j
bHVkZS9saW51eC9kbWEtZmVuY2UuaAo+ID4gKysrIGIvaW5jbHVkZS9saW51eC9kbWEtZmVuY2Uu
aAo+ID4gQEAgLTIzMSw2ICsyMzEsMTcgQEAgc3RydWN0IGRtYV9mZW5jZV9vcHMgewo+ID4gICAg
ICAgc2lnbmVkIGxvbmcgKCp3YWl0KShzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZSwKPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgYm9vbCBpbnRyLCBzaWduZWQgbG9uZyB0aW1lb3V0KTsKPiA+
Cj4gPiArICAgICAvKioKPiA+ICsgICAgICAqIEBib29zdDoKPiA+ICsgICAgICAqCj4gPiArICAg
ICAgKiBPcHRpb25hbCBjYWxsYmFjaywgdG8gaW5kaWNhdGUgdGhhdCBhIGZlbmNlIHdhaXRlciBt
aXNzZWQgYSBkZWFkbGluZS4KPiA+ICsgICAgICAqIFRoaXMgY2FuIHNlcnZlIGFzIGEgc2lnbmFs
IHRoYXQgKGlmIHBvc3NpYmxlKSB3aGF0ZXZlciBzaWduYWxzIHRoZQo+ID4gKyAgICAgICogZmVu
Y2Ugc2hvdWxkIGJvb3N0IGl0J3MgY2xvY2tzLgo+ID4gKyAgICAgICoKPiA+ICsgICAgICAqIFRo
aXMgY2FuIGJlIGNhbGxlZCBpbiBhbnkgY29udGV4dCB0aGF0IGNhbiBjYWxsIGRtYV9mZW5jZV93
YWl0KCkuCj4gPiArICAgICAgKi8KPiA+ICsgICAgIHZvaWQgKCpib29zdCkoc3RydWN0IGRtYV9m
ZW5jZSAqZmVuY2UpOwo+ID4gKwo+ID4gICAgICAgLyoqCj4gPiAgICAgICAgKiBAcmVsZWFzZToK
PiA+ICAgICAgICAqCj4gPiBAQCAtNTg2LDYgKzU5NywyMSBAQCBzdGF0aWMgaW5saW5lIHNpZ25l
ZCBsb25nIGRtYV9mZW5jZV93YWl0KHN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlLCBib29sIGludHIp
Cj4gPiAgICAgICByZXR1cm4gcmV0IDwgMCA/IHJldCA6IDA7Cj4gPiAgIH0KPiA+Cj4gPiArLyoq
Cj4gPiArICogZG1hX2ZlbmNlX2Jvb3N0IC0gaGludCBmcm9tIHdhaXRlciB0aGF0IGl0IG1pc3Nl
ZCBhIGRlYWRsaW5lCj4gPiArICoKPiA+ICsgKiBAZmVuY2U6IHRoZSBmZW5jZSB0aGF0IGNhdXNl
ZCB0aGUgbWlzc2VkIGRlYWRsaW5lCj4gPiArICoKPiA+ICsgKiBUaGlzIGZ1bmN0aW9uIGdpdmVz
IGEgaGludCBmcm9tIGEgZmVuY2Ugd2FpdGVyIHRoYXQgYSBkZWFkbGluZSB3YXMKPiA+ICsgKiBt
aXNzZWQsIHNvIHRoYXQgdGhlIGZlbmNlIHNpZ25hbGVyIGNhbiBmYWN0b3IgdGhpcyBpbiB0byBk
ZXZpY2UKPiA+ICsgKiBwb3dlciBzdGF0ZSBkZWNpc2lvbnMKPiA+ICsgKi8KPiA+ICtzdGF0aWMg
aW5saW5lIHZvaWQgZG1hX2ZlbmNlX2Jvb3N0KHN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlKQo+ID4g
K3sKPiA+ICsgICAgIGlmIChmZW5jZS0+b3BzLT5ib29zdCkKPiA+ICsgICAgICAgICAgICAgZmVu
Y2UtPm9wcy0+Ym9vc3QoZmVuY2UpOwo+ID4gK30KPiA+ICsKPiA+ICAgc3RydWN0IGRtYV9mZW5j
ZSAqZG1hX2ZlbmNlX2dldF9zdHViKHZvaWQpOwo+ID4gICB1NjQgZG1hX2ZlbmNlX2NvbnRleHRf
YWxsb2ModW5zaWduZWQgbnVtKTsKPiA+Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZnJlZWRyZW5vCg==
