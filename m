Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5403C2B6E
	for <lists+freedreno@lfdr.de>; Sat, 10 Jul 2021 00:32:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE9796E9AD;
	Fri,  9 Jul 2021 22:32:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F61E6E9B1
 for <freedreno@lists.freedesktop.org>; Fri,  9 Jul 2021 22:32:08 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 z18-20020a9d7a520000b02904b28bda1885so9563284otm.7
 for <freedreno@lists.freedesktop.org>; Fri, 09 Jul 2021 15:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=in4kX7sLTOvzGIkTNM27VoAm2lJJuZoW6Y2T2jtB9og=;
 b=hszLVAfastfyWky57gCrlZ/WcIVeDaPB73el6QR1RDtWzS2BSVi5iqH/MQAzIHxy9k
 pHW1JsuN2pCSrLkXKRkr++6Pme3Qy33J8zG25hrOIwCdJkxlunSag78fgccRAvjjFmtz
 P3mWNoFQitYr6cojWimJYGR8YaL3h6x/XYMAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=in4kX7sLTOvzGIkTNM27VoAm2lJJuZoW6Y2T2jtB9og=;
 b=GBI+tnRmq33KmeNXvEDkPF02pQb6F2O442jLfvXBHNLjXSZQCovxCxaioXtcqP0F1p
 Vvsuu7MtL9MI6uCmaWLGo5VdGfKtus8RopkCE3j4UCeNv+9zxXyzyB8sdwVXA1D3k/Kg
 pAV1vEm94UrMxvzH1HEE2Ub1R4Y5ZMBfoiqkucjJbaT2/0BALvByDertuaV/P1TMDAE5
 TQGNmRWiaMMiHtfKXA3fOliCaOtxtwlNvMLJo22awbteC2A3IZGOVENSpsRrQDDEbGgR
 RhHVYFm4rFfbnq2pLefW3QV5nBECOTc0dcJzTRJGz036wudySS4T0Ov0demStHf4GvRP
 I2Qg==
X-Gm-Message-State: AOAM532KU8p7zgHmHanw/BruujAIPTqnG0576qMOdhxgUxuIZjM6jJGv
 BC4IijvQWnD40Dt+vrq8YmXZvbETw7jwIA==
X-Google-Smtp-Source: ABdhPJxRFb1vtwo1MaoVRPmLqQ3lIbtP1/QYQEZEll8qsXzy7I4q3UY+aW6B13YMefFLync3o9ZwMw==
X-Received: by 2002:a9d:4c0c:: with SMTP id l12mr28762130otf.165.1625869927300; 
 Fri, 09 Jul 2021 15:32:07 -0700 (PDT)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com.
 [209.85.210.53])
 by smtp.gmail.com with ESMTPSA id 15sm1105191oin.7.2021.07.09.15.32.07
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 15:32:07 -0700 (PDT)
Received: by mail-ot1-f53.google.com with SMTP id
 i5-20020a9d68c50000b02904b41fa91c97so6636212oto.5
 for <freedreno@lists.freedesktop.org>; Fri, 09 Jul 2021 15:32:07 -0700 (PDT)
X-Received: by 2002:a25:60c1:: with SMTP id
 u184mr49707810ybb.343.1625869916303; 
 Fri, 09 Jul 2021 15:31:56 -0700 (PDT)
MIME-Version: 1.0
References: <1624726268-14869-1-git-send-email-rajeevny@codeaurora.org>
 <CAD=FV=UP9jrS=JG=TuB7+i9QcZv8GOLYdPdb3_KNhEsgapGeww@mail.gmail.com>
 <YOi0WbTP0crIkOGy@intel.com>
In-Reply-To: <YOi0WbTP0crIkOGy@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 9 Jul 2021 15:31:44 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vce_zdKMgzg+X-hK8XPEeuMEN3ViFnsb7AEsz1=EN-+A@mail.gmail.com>
Message-ID: <CAD=FV=Vce_zdKMgzg+X-hK8XPEeuMEN3ViFnsb7AEsz1=EN-+A@mail.gmail.com>
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [Freedreno] [v8 0/6] drm: Support basic DPCD backlight in
 panel-simple and add a new panel ATNA33XC20
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-fbdev@vger.kernel.org,
 Rajeev Nandan <rajeevny@codeaurora.org>,
 Krishna Manikandan <mkrishn@codeaurora.org>,
 Jani Nikula <jani.nikula@intel.com>, Lee Jones <lee.jones@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

SGksCgpPbiBGcmksIEp1bCA5LCAyMDIxIGF0IDE6NDEgUE0gVmlsbGUgU3lyasOkbMOkCjx2aWxs
ZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIEp1bCAwOSwgMjAy
MSBhdCAwNjo1NDowNUFNIC0wNzAwLCBEb3VnIEFuZGVyc29uIHdyb3RlOgo+ID4gSGksCj4gPgo+
ID4gT24gU2F0LCBKdW4gMjYsIDIwMjEgYXQgOTo1MiBBTSBSYWplZXYgTmFuZGFuIDxyYWplZXZu
eUBjb2RlYXVyb3JhLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IFRoaXMgc2VyaWVzIGFkZHMgdGhl
IHN1cHBvcnQgZm9yIHRoZSBlRFAgcGFuZWwgdGhhdCBuZWVkcyB0aGUgYmFja2xpZ2h0Cj4gPiA+
IGNvbnRyb2xsaW5nIG92ZXIgdGhlIERQIEFVWCBjaGFubmVsIHVzaW5nIERQQ0QgcmVnaXN0ZXJz
IG9mIHRoZSBwYW5lbAo+ID4gPiBhcyBwZXIgdGhlIFZFU0EncyBzdGFuZGFyZC4KPiA+ID4KPiA+
ID4gVGhpcyBzZXJpZXMgYWxzbyBhZGRzIHN1cHBvcnQgZm9yIHRoZSBTYW1zdW5nIGVEUCBBTU9M
RUQgcGFuZWwgdGhhdAo+ID4gPiBuZWVkcyBEUCBBVVggdG8gY29udHJvbCB0aGUgYmFja2xpZ2h0
LCBhbmQgaW50cm9kdWNlcyBuZXcgZGVsYXlzIGluIHRoZQo+ID4gPiBAcGFuZWxfZGVzYy5kZWxh
eSB0byBzdXBwb3J0IHRoaXMgcGFuZWwuCj4gPiA+Cj4gPiA+IFRoaXMgcGF0Y2ggc2VyaWVzIGRl
cGVuZHMgb24gdGhlIGZvbGxvd2luZyB0d28gc2VyaWVzOgo+ID4gPiAtIERvdWcncyBzZXJpZXMg
WzFdLCBleHBvc2VkIHRoZSBEUCBBVVggY2hhbm5lbCB0byB0aGUgcGFuZWwtc2ltcGxlLgo+ID4g
PiAtIEx5dWRlJ3Mgc2VyaWVzIFsyXSwgaW50cm9kdWNlZCBuZXcgZHJtIGhlbHBlciBmdW5jdGlv
bnMgZm9yIERQQ0QKPiA+ID4gICBiYWNrbGlnaHQuCj4gPiA+Cj4gPiA+IFRoaXMgc2VyaWVzIGlz
IHRoZSBsb2dpY2FsIHN1Y2Nlc3NvciB0byB0aGUgc2VyaWVzIFszXS4KPiA+ID4KPiA+ID4gQ2hh
bmdlcyBpbiB2MToKPiA+ID4gLSBDcmVhdGVkIGRwY2QgYmFja2xpZ2h0IGhlbHBlciB3aXRoIHZl
cnkgYmFzaWMgZnVuY3Rpb25hbGl0eSwgYWRkZWQKPiA+ID4gICBiYWNrbGlnaHQgcmVnaXN0cmF0
aW9uIGluIHRoZSB0aS1zbjY1ZHNpODYgYnJpZGdlIGRyaXZlci4KPiA+ID4KPiA+ID4gQ2hhbmdl
cyBpbiB2MjoKPiA+ID4gLSBDcmVhdGVkIGEgbmV3IERpc3BsYXlQb3J0IGF1eCBiYWNrbGlnaHQg
ZHJpdmVyIGFuZCBtb3ZlZCB0aGUgY29kZSBmcm9tCj4gPiA+ICAgZHJtX2RwX2F1eF9iYWNrbGln
aHQuYyAodjEpIHRvIHRoZSBuZXcgZHJpdmVyLgo+ID4gPgo+ID4gPiBDaGFuZ2VzIGluIHYzOgo+
ID4gPiAtIEZpeGVkIG1vZHVsZSBjb21waWxhdGlvbiAoa2VybmVsIHRlc3QgYm90KS4KPiA+ID4K
PiA+ID4gQ2hhbmdlcyBpbiB2NDoKPiA+ID4gLSBBZGRlZCBiYXNpYyBEUENEIGJhY2tsaWdodCBz
dXBwb3J0IGluIHBhbmVsLXNpbXBsZS4KPiA+ID4gLSBBZGRlZCBzdXBwb3J0IGZvciBhIG5ldyBT
YW1zdW5nIHBhbmVsIEFUTkEzM1hDMjAgdGhhdCBuZWVkcyBEUENECj4gPiA+ICAgYmFja2xpZ2h0
IGNvbnRyb2xsaW5nIGFuZCBoYXMgYSByZXF1aXJlbWVudCBvZiBkZWxheXMgYmV0d2VlbiBlbmFi
bGUKPiA+ID4gICBHUElPIGFuZCByZWd1bGF0b3IuCj4gPiA+Cj4gPiA+IENoYW5nZXMgaW4gdjU6
Cj4gPiA+IEFkZHJlc3NlZCByZXZpZXcgc3VnZ2VzdGlvbnMgZnJvbSBEb3VnbGFzOgo+ID4gPiAt
IENyZWF0ZWQgYSBuZXcgQVBJIGRybV9wYW5lbF9kcF9hdXhfYmFja2xpZ2h0KCkgaW4gZHJtX3Bh
bmVsLmMKPiA+ID4gLSBNb3ZlZCBEUCBBVVggYmFja2xpZ2h0IGZ1bmN0aW9ucyBmcm9tIHBhbmVs
LXNpbXBsZS5jIHRvIGRybV9wYW5lbC5jCj4gPiA+IC0gcGFuZWwtc2ltcGxlIHByb2JlKCkgY2Fs
bHMgZHJtX3BhbmVsX2RwX2F1eF9iYWNrbGlnaHQoKSB0byBjcmVhdGUKPiA+ID4gICBiYWNrbGln
aHQgd2hlbiB0aGUgYmFja2xpZ2h0IHBoYW5kbGUgaXMgbm90IHNwZWNpZmllZCBpbiBwYW5lbCBE
VAo+ID4gPiAgIGFuZCBEUCBBVVggY2hhbm5lbCBpcyBwcmVzZW50Lgo+ID4gPiAtIEFkZGVkIGNo
ZWNrIGZvciBkcm1fZWRwX2JhY2tsaWdodF9zdXBwb3J0ZWQoKSBiZWZvcmUgcmVnaXN0ZXJpbmcu
Cj4gPiA+IC0gUmVtb3ZlZCB0aGUgQHVzZXNfZHBjZF9iYWNrbGlnaHQgZmxhZyBmcm9tIHBhbmVs
X2Rlc2MgYXMgdGhpcwo+ID4gPiAgIHNob3VsZCBiZSBhdXRvLWRldGVjdGVkLgo+ID4gPiAtIFVw
ZGF0ZWQgY29tbWVudHMvZGVzY3JpcHRpb25zLgo+ID4gPgo+ID4gPiBDaGFuZ2VzIGluIHY2Ogo+
ID4gPiAtIFJlYmFzZWQKPiA+ID4gLSBVcGRhdGVkIHdhbnJuaW5nIG1lc3NhZ2VzLCBmaXhlZCB3
b3JkIHdyYXBwaW5nIGluIGNvbW1lbnRzLgo+ID4gPiAtIEZpeGVkIG9yZGVyaW5nIG9mIG1lbW9y
eSBhbGxvY2F0aW9uCj4gPiA+Cj4gPiA+IENoYW5nZXMgaW4gdjc6Cj4gPiA+IC0gVXBkYXRlZCB0
aGUgZGlzYWJsZV90b19wb3dlcl9vZmYgYW5kIHBvd2VyX3RvX2VuYWJsZSBwYW5lbCBkZWxheXMK
PiA+ID4gYXMgZGlzY292ZXJlZCBhdCA8aHR0cHM6Ly9jcnJldi5jb20vYy8yOTY2MTY3PiAoRG91
Z2xhcykKPiA+ID4KPiA+ID4gQ2hhbmdlcyBpbiB2ODoKPiA+ID4gLSBOb3cgdXNpbmcgYmFja2xp
Z2h0X2lzX2JsYW5rKCkgdG8gZ2V0IHRoZSBiYWNrbGlnaHQgYmxhbmsgc3RhdHVzIChTYW0gUmF2
bmJvcmcpCj4gPiA+IC0gQWRkZWQgYSBuZXcgcGF0Y2ggIzQgdG8gZml4IHRoZSB3YXJuaW5ncyBm
b3IgZURQIHBhbmVsIGRlc2NyaXB0aW9uIChTYW0gUmF2bmJvcmcpCj4gPiA+Cj4gPiA+IFsxXSBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9kcmktZGV2ZWwvMjAyMTA1MjUwMDAxNTkuMzM4NDkyMS0x
LWRpYW5kZXJzQGNocm9taXVtLm9yZy8KPiA+ID4gWzJdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2RyaS1kZXZlbC8yMDIxMDUxNDE4MTUwNC41NjUyNTItMS1seXVkZUByZWRoYXQuY29tLwo+ID4g
PiBbM10gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvZHJpLWRldmVsLzE2MTk0MTY3NTYtMzUzMy0x
LWdpdC1zZW5kLWVtYWlsLXJhamVldm55QGNvZGVhdXJvcmEub3JnLwo+ID4gPgo+ID4gPiBSYWpl
ZXYgTmFuZGFuICg2KToKPiA+ID4gICBkcm0vcGFuZWw6IGFkZCBiYXNpYyBEUCBBVVggYmFja2xp
Z2h0IHN1cHBvcnQKPiA+ID4gICBkcm0vcGFuZWwtc2ltcGxlOiBTdXBwb3J0IERQIEFVWCBiYWNr
bGlnaHQKPiA+ID4gICBkcm0vcGFuZWwtc2ltcGxlOiBTdXBwb3J0IGZvciBkZWxheXMgYmV0d2Vl
biBHUElPICYgcmVndWxhdG9yCj4gPiA+ICAgZHJtL3BhbmVsLXNpbXBsZTogVXBkYXRlIHZhbGlk
YXRpb24gd2FybmluZ3MgZm9yIGVEUCBwYW5lbCBkZXNjcmlwdGlvbgo+ID4gPiAgIGR0LWJpbmRp
bmdzOiBkaXNwbGF5OiBzaW1wbGU6IEFkZCBTYW1zdW5nIEFUTkEzM1hDMjAKPiA+ID4gICBkcm0v
cGFuZWwtc2ltcGxlOiBBZGQgU2Ftc3VuZyBBVE5BMzNYQzIwCj4gPiA+Cj4gPiA+ICAuLi4vYmlu
ZGluZ3MvZGlzcGxheS9wYW5lbC9wYW5lbC1zaW1wbGUueWFtbCAgICAgICB8ICAgMiArCj4gPiA+
ICBkcml2ZXJzL2dwdS9kcm0vZHJtX3BhbmVsLmMgICAgICAgICAgICAgICAgICAgICAgICB8IDEw
OCArKysrKysrKysrKysrKysrKysrKysKPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5l
bC1zaW1wbGUuYyAgICAgICAgICAgICAgIHwgIDczICsrKysrKysrKysrKystCj4gPiA+ICBpbmNs
dWRlL2RybS9kcm1fcGFuZWwuaCAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxNSArKy0K
PiA+ID4gIDQgZmlsZXMgY2hhbmdlZCwgMTkwIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0p
Cj4gPgo+ID4gUHVzaGVkIHRvIGRybS1taXNjLW5leHQuCj4gPgo+ID4gNGJmZTZjOGY3YzIzIGRy
bS9wYW5lbC1zaW1wbGU6IEFkZCBTYW1zdW5nIEFUTkEzM1hDMjAKPiA+IGMyMGRlYzE5MzU4NCBk
dC1iaW5kaW5nczogZGlzcGxheTogc2ltcGxlOiBBZGQgU2Ftc3VuZyBBVE5BMzNYQzIwCj4gPiAx
M2FjZWVhNTZmZDUgZHJtL3BhbmVsLXNpbXBsZTogVXBkYXRlIHZhbGlkYXRpb24gd2FybmluZ3Mg
Zm9yIGVEUAo+ID4gcGFuZWwgZGVzY3JpcHRpb24KPiA+IDE4YTE0ODhiZjFlMSBkcm0vcGFuZWwt
c2ltcGxlOiBTdXBwb3J0IGZvciBkZWxheXMgYmV0d2VlbiBHUElPICYgcmVndWxhdG9yCj4gPiBi
ZmQ0NTE0MDNkNzAgZHJtL3BhbmVsLXNpbXBsZTogU3VwcG9ydCBEUCBBVVggYmFja2xpZ2h0Cj4g
PiAxMGY3YjQwZTRmMzAgZHJtL3BhbmVsOiBhZGQgYmFzaWMgRFAgQVVYIGJhY2tsaWdodCBzdXBw
b3J0Cj4KPiBkZXBtb2Q6IEVSUk9SOiBDeWNsZSBkZXRlY3RlZDogZHJtX2ttc19oZWxwZXIgLT4g
ZHJtIC0+IGRybV9rbXNfaGVscGVyCj4KPiBMb29rcyB0byBiZSBkdWUgdG8gZHJtX2VkcF9iYWNr
bGlnaHRfZW5hYmxlKCkuCgpVZ2guIFRoYW5rcyBmb3IgdGhlIHJlcG9ydCEgSSd2ZSB0YWtlbiBh
IHNjaHdhZyBhdCBhIGZpeCBoZXJlOgoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIx
MDcwOTE1MjkwOS4xLkkyM2ViNGNjNWE2ODAzNDFlN2IzZTc5MTYzMmE2MzU1NjZmYTU4MDZhQGNo
YW5nZWlkLwoKLURvdWcKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRy
ZW5vCg==
