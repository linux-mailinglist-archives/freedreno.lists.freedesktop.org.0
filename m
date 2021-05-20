Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AEB38B3E8
	for <lists+freedreno@lfdr.de>; Thu, 20 May 2021 18:01:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11DBC6F4AA;
	Thu, 20 May 2021 16:01:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 299106F4A5;
 Thu, 20 May 2021 16:01:43 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id gb17so8100336ejc.8;
 Thu, 20 May 2021 09:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=imwdyaKKV+NTp3FXAevAFcHpCToqH3iOS9Vt3SE6cTE=;
 b=XBiHCka5uBHuz5fn0Z4r0qzSTdFtAIT7vSNFN52Xm4iLwLfjuvEAe9LOaTuP5pmFKx
 KecdhBkcsesCEzeLN5jY21HTxjnuzhI5b1Am95hg+/n4PgSIOY0UHLQpqsQihdkcWXV1
 wuLKGfkcuwHCWPJ2BLgZ30k88QmJheHEex6rPb/rErpvhfBS04PSAYZBASK2esYVfy6x
 zzOPLbOjaDpswhkgU+OlqR3ppMAX5q4uSWKZube+RUpAi4diGO+rzVP6K5fky1Er+gju
 h9fNgcQ/nIgyauKeJFJfn0W5kiL3KiMHo32joM9Pji1fjEjxzh79jljdi/VxcTR3uLa1
 jf/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=imwdyaKKV+NTp3FXAevAFcHpCToqH3iOS9Vt3SE6cTE=;
 b=RthiNwFaCG9uaAONf2WUsRW5u5bOcfbcxMJ1lE7Wv8A45izimE2cPYLLA1PmWVr4Hr
 OX211KOUJ0N80Aq2I28Yk5vEtQ3pQTOk3rrvl4Qr5xbJq9S+BKAx7jL4NThhSoefUWYI
 kuWXlEm5EJziAI1vU67PjzrHSKw41M+/nLH/v5AVjrEHtlPROTfE7stq8SpwXr4cvW4r
 wEisVojtDeT2ycEI5RCmtoVHEhML6Y5XV/t1MGeCu4LOtHaGP83u1yqDlmanos7qDS5c
 W60fsChytbcz2WJg3V6Q4Hrt4kQulr/iCIOGn07GKAK+vWO1XeWXsG6Soj6MytBcavYn
 G+Bg==
X-Gm-Message-State: AOAM530noCqNwh1AIPwXgoEvZT2ttwsmt6etrF3ssDvrK4K5uCYNHK4n
 b870PP4wdFLJLL3JXHFFMKI=
X-Google-Smtp-Source: ABdhPJxeDIFokndYejULm3Ge/2ATpBq0kBTh/yX8nSrUPqbj4W3Ug8DZwfF2ngl9h024wyPYc34BXQ==
X-Received: by 2002:a17:907:2d0d:: with SMTP id
 gs13mr5570681ejc.266.1621526501621; 
 Thu, 20 May 2021 09:01:41 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:b48f:ff97:fb4c:5b1d?
 ([2a02:908:1252:fb60:b48f:ff97:fb4c:5b1d])
 by smtp.gmail.com with ESMTPSA id i19sm1573470ejd.114.2021.05.20.09.01.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 May 2021 09:01:41 -0700 (PDT)
To: Rob Clark <robdclark@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20210519183855.1523927-1-robdclark@gmail.com>
 <20210519183855.1523927-2-robdclark@gmail.com>
 <8dcdc8d5-176c-f0ad-0d54-6466e9e68a0a@amd.com>
 <CAF6AEGtg_VnxYrj94AfbAfViK1v8U0ZJyfJjS4taVLMF=YVy+w@mail.gmail.com>
 <d65acf46-4c3b-4903-6222-0b81915d355d@amd.com>
 <CAF6AEGvm1tFwpfyJrX1bTGoHg_wzKKLQvSk2qLHf3XeqvEzDPA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <e8f3d71c-7025-deab-4dd7-14f3fa6a8810@gmail.com>
Date: Thu, 20 May 2021 18:01:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAF6AEGvm1tFwpfyJrX1bTGoHg_wzKKLQvSk2qLHf3XeqvEzDPA@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Freedreno] [Linaro-mm-sig] [RFC 1/3] dma-fence: Add boost
 fence op
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
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

QW0gMjAuMDUuMjEgdW0gMTY6NTQgc2NocmllYiBSb2IgQ2xhcms6Cj4gT24gVGh1LCBNYXkgMjAs
IDIwMjEgYXQgNzoxMSBBTSBDaHJpc3RpYW4gS8O2bmlnCj4gPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4gd3JvdGU6Cj4+Cj4+Cj4+IEFtIDIwLjA1LjIxIHVtIDE2OjA3IHNjaHJpZWIgUm9iIENs
YXJrOgo+Pj4gT24gV2VkLCBNYXkgMTksIDIwMjEgYXQgMTE6NDcgUE0gQ2hyaXN0aWFuIEvDtm5p
Zwo+Pj4gPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4+Pj4gVWZmLCB0aGF0IGxv
b2tzIHZlcnkgaGFyZHdhcmUgc3BlY2lmaWMgdG8gbWUuCj4+PiBIb3dzbz8gIEknbSBub3Qgc3Vy
ZSBJIGFncmVlLi4gYW5kIGV2ZW4gaWYgaXQgd2FzIG5vdCB1c2VmdWwgZm9yIHNvbWUKPj4+IGh3
LCBpdCBzaG91bGQgYmUgdXNlZnVsIGZvciBlbm91Z2ggZHJpdmVycyAoYW5kIGhhcm0gbm8gZHJp
dmVycyksIHNvIEkKPj4+IHN0aWxsIHRoaW5rIGl0IGlzIGEgZ29vZCBpZGVhCj4+Pgo+Pj4gVGhl
IGZhbGxiYWNrIHBsYW4gaXMgdG8gZ28gdGhlIGk5MTUgcm91dGUgYW5kIHN0b3AgdXNpbmcgYXRv
bWljCj4+PiBoZWxwZXJzIGFuZCBkbyB0aGUgc2FtZSB0aGluZyBpbnNpZGUgdGhlIGRyaXZlciwg
YnV0IHRoYXQgZG9lc24ndCBoZWxwCj4+PiBhbnkgb2YgdGhlIGNhc2VzIHdoZXJlIHlvdSBoYXZl
IGEgc2VwYXJhdGUga21zIGFuZCBncHUgZHJpdmVyLgo+PiBZZWFoLCB0aGF0J3MgY2VydGFpbmx5
IG5vdCBzb21ldGhpbmcgd2Ugd2FudC4KPj4KPj4+PiBBcyBmYXIgYXMgSSBjYW4gc2VlIHlvdSBj
YW4gYWxzbyBpbXBsZW1lbnQgY29tcGxldGVseSBpbnNpZGUgdGhlIGJhY2tlbmQKPj4+PiBieSBz
dGFydGluZyBhIHRpbWVyIG9uIGVuYWJsZV9zaWduYWxpbmcsIGRvbid0IHlvdT8KPj4+IE5vdCBy
ZWFsbHkuLiBJIG1lYW4sIHRoZSBmYWN0IHRoYXQgc29tZXRoaW5nIHdhaXRlZCBvbiBhIGZlbmNl
IGNvdWxkCj4+PiBiZSBhIHVzZWZ1bCBpbnB1dCBzaWduYWwgdG8gZ3B1IGZyZXEgZ292ZXJub3Is
IGJ1dCBpdCBpcyBlbnRpcmVseQo+Pj4gaW5zdWZmaWNpZW50Li4KPj4+Cj4+PiBJZiB0aGUgY3B1
IGlzIHNwZW5kaW5nIGEgbG90IG9mIHRpbWUgd2FpdGluZyBvbiBhIGZlbmNlLCBjcHVmcmVxIHdp
bGwKPj4+IGNsb2NrIGRvd24gc28geW91IHNwZW5kIGxlc3MgdGltZSB3YWl0aW5nLiAgQW5kIG5v
IHByb2JsZW0gaGFzIGJlZW4KPj4+IHNvbHZlZC4gIFlvdSBhYnNvbHV0ZWx5IG5lZWQgdGhlIGNv
bmNlcHQgb2YgYSBtaXNzZWQgZGVhZGxpbmUsIGFuZCBhCj4+PiB0aW1lciBkb2Vzbid0IGdpdmUg
eW91IHRoYXQuCj4+IE9rIHRoZW4gSSBwcm9iYWJseSBkb24ndCB1bmRlcnN0YW5kIHRoZSB1c2Ug
Y2FzZSBoZXJlLgo+Pgo+PiBXaGF0IGV4YWN0bHkgZG8geW91IHRyeSB0byBzb2x2ZT8KPiBCYXNp
Y2FsbHkgc2l0dWF0aW9ucyB3aGVyZSB5b3UgYXJlIHBpbmctcG9uZ2luZyBiZXR3ZWVuIEdQVSBh
bmQgQ1BVLi4KPiBmb3IgZXhhbXBsZSBpZiB5b3UgYXJlIGRvdWJsZSBidWZmZXJpbmcgaW5zdGVh
ZCBvZiB0cmlwbGUgYnVmZmVyaW5nLAo+IGFuZCBkb2luZyB2Ymxhbmsgc3luYydkIHBhZ2VmbGlw
cy4gIFRoZSBHUFUsIHdpdGhvdXQgYW55IGV4dHJhIHNpZ25hbCwKPiBjb3VsZCBnZXQgc3R1Y2sg
YXQgMzBmcHMgYW5kIGEgbG93IGdwdSBmcmVxLCBiZWNhdXNlIGl0IGVuZHMgdXAgaWRsZQo+IHdo
aWxlIHdhaXRpbmcgZm9yIGFuIGV4dHJhIHZibGFuayBjeWNsZSBmb3IgdGhlIG5leHQgYmFjay1i
dWZmZXIgdG8KPiBiZWNvbWUgYXZhaWxhYmxlLiAgV2hlcmVhcyBpZiBpdCBib29zdGVkIHVwIHRv
IGEgaGlnaGVyIGZyZXEgYW5kCj4gc3RvcHBlZCBtaXNzaW5nIGEgdmJsYW5rIGRlYWRsaW5lLCBp
dCB3b3VsZCBiZSBsZXNzIGlkbGUgZHVlIHRvCj4gZ2V0dGluZyB0aGUgbmV4dCBiYWNrLWJ1ZmZl
ciBzb29uZXIgKGR1ZSB0byBub3QgbWlzc2luZyBhIHZibGFuawo+IGRlYWRsaW5lKS4KCk9rIHRo
ZSBpcyB0aGUgd2h5LCBidXQgd2hhdCBhYm91dCB0aGUgaG93PwoKSG93IGRvZXMgaXQgaGVscCB0
byBoYXZlIHRoaXMgYm9vc3QgY2FsbGJhY2sgYW5kIG5vdCBqdXN0IHN0YXJ0IGEgdGltZSAKb24g
ZW5hYmxlIHNpZ25hbGluZyBhbmQgc3RvcCBpdCB3aGVuIHRoZSBzaWduYWwgYXJyaXZlcz8KClJl
Z2FyZHMsCkNocmlzdGlhbi4KCj4KPiBCUiwKPiAtUgo+Cj4+IFRoYW5rcywKPj4gQ2hyaXN0aWFu
Lgo+Pgo+Pj4gQlIsCj4+PiAtUgo+Pj4KPj4+PiBDaHJpc3RpYW4uCj4+Pj4KPj4+PiBBbSAxOS4w
NS4yMSB1bSAyMDozOCBzY2hyaWViIFJvYiBDbGFyazoKPj4+Pj4gRnJvbTogUm9iIENsYXJrIDxy
b2JkY2xhcmtAY2hyb21pdW0ub3JnPgo+Pj4+Pgo+Pj4+PiBBZGQgYSB3YXkgdG8gaGludCB0byB0
aGUgZmVuY2Ugc2lnbmFsZXIgdGhhdCBhIGZlbmNlIHdhaXRlciBoYXMgbWlzc2VkIGEKPj4+Pj4g
ZGVhZGxpbmUgd2FpdGluZyBvbiB0aGUgZmVuY2UuCj4+Pj4+Cj4+Pj4+IEluIHNvbWUgY2FzZXMs
IG1pc3NpbmcgYSB2YmxhbmsgY2FuIHJlc3VsdCBpbiBsb3dlciBncHUgdXRpbGl6YXRpb24sCj4+
Pj4+IHdoZW4gcmVhbGx5IHdlIHdhbnQgdG8gZ28gaW4gdGhlIG9wcG9zaXRlIGRpcmVjdGlvbiBh
bmQgYm9vc3QgZ3B1IGZyZXEuCj4+Pj4+IFRoZSBib29zdCBjYWxsYmFjayBnaXZlcyBzb21lIGZl
ZWRiYWNrIHRvIHRoZSBmZW5jZSBzaWduYWxlciB0aGF0IHdlCj4+Pj4+IGFyZSBtaXNzaW5nIGRl
YWRsaW5lcywgc28gaXQgY2FuIHRha2UgdGhpcyBpbnRvIGFjY291bnQgaW4gaXQncyBmcmVxLwo+
Pj4+PiB1dGlsaXphdGlvbiBjYWxjdWxhdGlvbnMuCj4+Pj4+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6
IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KPj4+Pj4gLS0tCj4+Pj4+ICAgICBp
bmNsdWRlL2xpbnV4L2RtYS1mZW5jZS5oIHwgMjYgKysrKysrKysrKysrKysrKysrKysrKysrKysK
Pj4+Pj4gICAgIDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspCj4+Pj4+Cj4+Pj4+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2RtYS1mZW5jZS5oIGIvaW5jbHVkZS9saW51eC9kbWEt
ZmVuY2UuaAo+Pj4+PiBpbmRleCA5ZjEyZWZhYWE5M2EuLjE3MjcwMjUyMWFjYyAxMDA2NDQKPj4+
Pj4gLS0tIGEvaW5jbHVkZS9saW51eC9kbWEtZmVuY2UuaAo+Pj4+PiArKysgYi9pbmNsdWRlL2xp
bnV4L2RtYS1mZW5jZS5oCj4+Pj4+IEBAIC0yMzEsNiArMjMxLDE3IEBAIHN0cnVjdCBkbWFfZmVu
Y2Vfb3BzIHsKPj4+Pj4gICAgICAgICBzaWduZWQgbG9uZyAoKndhaXQpKHN0cnVjdCBkbWFfZmVu
Y2UgKmZlbmNlLAo+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYm9vbCBpbnRyLCBz
aWduZWQgbG9uZyB0aW1lb3V0KTsKPj4+Pj4KPj4+Pj4gKyAgICAgLyoqCj4+Pj4+ICsgICAgICAq
IEBib29zdDoKPj4+Pj4gKyAgICAgICoKPj4+Pj4gKyAgICAgICogT3B0aW9uYWwgY2FsbGJhY2ss
IHRvIGluZGljYXRlIHRoYXQgYSBmZW5jZSB3YWl0ZXIgbWlzc2VkIGEgZGVhZGxpbmUuCj4+Pj4+
ICsgICAgICAqIFRoaXMgY2FuIHNlcnZlIGFzIGEgc2lnbmFsIHRoYXQgKGlmIHBvc3NpYmxlKSB3
aGF0ZXZlciBzaWduYWxzIHRoZQo+Pj4+PiArICAgICAgKiBmZW5jZSBzaG91bGQgYm9vc3QgaXQn
cyBjbG9ja3MuCj4+Pj4+ICsgICAgICAqCj4+Pj4+ICsgICAgICAqIFRoaXMgY2FuIGJlIGNhbGxl
ZCBpbiBhbnkgY29udGV4dCB0aGF0IGNhbiBjYWxsIGRtYV9mZW5jZV93YWl0KCkuCj4+Pj4+ICsg
ICAgICAqLwo+Pj4+PiArICAgICB2b2lkICgqYm9vc3QpKHN0cnVjdCBkbWFfZmVuY2UgKmZlbmNl
KTsKPj4+Pj4gKwo+Pj4+PiAgICAgICAgIC8qKgo+Pj4+PiAgICAgICAgICAqIEByZWxlYXNlOgo+
Pj4+PiAgICAgICAgICAqCj4+Pj4+IEBAIC01ODYsNiArNTk3LDIxIEBAIHN0YXRpYyBpbmxpbmUg
c2lnbmVkIGxvbmcgZG1hX2ZlbmNlX3dhaXQoc3RydWN0IGRtYV9mZW5jZSAqZmVuY2UsIGJvb2wg
aW50cikKPj4+Pj4gICAgICAgICByZXR1cm4gcmV0IDwgMCA/IHJldCA6IDA7Cj4+Pj4+ICAgICB9
Cj4+Pj4+Cj4+Pj4+ICsvKioKPj4+Pj4gKyAqIGRtYV9mZW5jZV9ib29zdCAtIGhpbnQgZnJvbSB3
YWl0ZXIgdGhhdCBpdCBtaXNzZWQgYSBkZWFkbGluZQo+Pj4+PiArICoKPj4+Pj4gKyAqIEBmZW5j
ZTogdGhlIGZlbmNlIHRoYXQgY2F1c2VkIHRoZSBtaXNzZWQgZGVhZGxpbmUKPj4+Pj4gKyAqCj4+
Pj4+ICsgKiBUaGlzIGZ1bmN0aW9uIGdpdmVzIGEgaGludCBmcm9tIGEgZmVuY2Ugd2FpdGVyIHRo
YXQgYSBkZWFkbGluZSB3YXMKPj4+Pj4gKyAqIG1pc3NlZCwgc28gdGhhdCB0aGUgZmVuY2Ugc2ln
bmFsZXIgY2FuIGZhY3RvciB0aGlzIGluIHRvIGRldmljZQo+Pj4+PiArICogcG93ZXIgc3RhdGUg
ZGVjaXNpb25zCj4+Pj4+ICsgKi8KPj4+Pj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBkbWFfZmVuY2Vf
Ym9vc3Qoc3RydWN0IGRtYV9mZW5jZSAqZmVuY2UpCj4+Pj4+ICt7Cj4+Pj4+ICsgICAgIGlmIChm
ZW5jZS0+b3BzLT5ib29zdCkKPj4+Pj4gKyAgICAgICAgICAgICBmZW5jZS0+b3BzLT5ib29zdChm
ZW5jZSk7Cj4+Pj4+ICt9Cj4+Pj4+ICsKPj4+Pj4gICAgIHN0cnVjdCBkbWFfZmVuY2UgKmRtYV9m
ZW5jZV9nZXRfc3R1Yih2b2lkKTsKPj4+Pj4gICAgIHU2NCBkbWFfZmVuY2VfY29udGV4dF9hbGxv
Yyh1bnNpZ25lZCBudW0pOwo+Pj4+Pgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gTGluYXJvLW1tLXNpZyBtYWlsaW5nIGxpc3QKPiBMaW5hcm8tbW0t
c2lnQGxpc3RzLmxpbmFyby5vcmcKPiBodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW5hcm8tbW0tc2lnCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpGcmVlZHJlbm8gbWFpbGluZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9mcmVlZHJlbm8K
