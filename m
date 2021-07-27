Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBB43D835D
	for <lists+freedreno@lfdr.de>; Wed, 28 Jul 2021 00:44:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD90D6EB23;
	Tue, 27 Jul 2021 22:44:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4B76EB23
 for <freedreno@lists.freedesktop.org>; Tue, 27 Jul 2021 22:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627425880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DK7QOr93tpO6ZeVlMj41CdryUvlpzzBljDxRIdRpu00=;
 b=BNBFkjcUhadL3BQWyc37xKdRlpCEaCexpaGvp2l89GhoV8LJUG7roACqpm3AIsBcuR8QoL
 9M3zfsRu995w/12KZ+AMmaSGr3ND496b4/6gZv13GF5sNBY0Sys4i7SJtsJStod4CVU7P5
 /fvADfWPzdaihXQzoZHccUbUEpi3CPI=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-XZOj1S5XOL6ClsrvgbT4QA-1; Tue, 27 Jul 2021 18:44:37 -0400
X-MC-Unique: XZOj1S5XOL6ClsrvgbT4QA-1
Received: by mail-qt1-f197.google.com with SMTP id
 15-20020ac84e8f0000b029024e8c2383c1so7443qtp.5
 for <freedreno@lists.freedesktop.org>; Tue, 27 Jul 2021 15:44:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=DK7QOr93tpO6ZeVlMj41CdryUvlpzzBljDxRIdRpu00=;
 b=B3q5Nfpi035056o0dqtRGlayi3F5rj9jp6pTfbDIhM/EYw32KduDtwF5CGsUnLhfSV
 H8l58d2DN84QwOJY7KYqg6knArkt3PmRPXG2D3prxBcE5+7ghvBoHYIOArO2oTdQb+I9
 KrQf8Jghk2j/hPvtCNT1A8BC4vx2G1pDXFaqYc9ZXGIofZseNjFOR7LtqZPht44gGfQ/
 I1KIoYRAVwkkh7TvgLjydqirLvi94nmKY5YKDjdW4PTs0QJvVM80OX/M2PwuJZmquQ5J
 gU2AwrrWvznmOZm04CvEL2A9KC6zsTxAPr+3KtlZphmkb9oOIqiFi41wHKu2/5bWqhgY
 LHug==
X-Gm-Message-State: AOAM532vMPX9avwvmGFU0kNaz/tZ1cAj2At8TYX5OH5b9iDS82RTuzMp
 yeGZsRPxmIdN8YHd3ENN50v9pvOYyOBy5EDUPzofCALU4QGBeSY2jmQzh/DLbYTWXyhSsU/lu9s
 ZR83E8IZI1Eec1MwbC4UCxLxJXAVL
X-Received: by 2002:a37:a58f:: with SMTP id
 o137mr24235546qke.451.1627425876355; 
 Tue, 27 Jul 2021 15:44:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGj2G2MLvOCQdZF7LANv0fXdRF2QJsKwLJaBjD7XP2EqW1YquS1Ayo6QYNoe1V968s25GfaQ==
X-Received: by 2002:a37:a58f:: with SMTP id
 o137mr24235523qke.451.1627425876205; 
 Tue, 27 Jul 2021 15:44:36 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id s3sm2051101qtn.4.2021.07.27.15.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 15:44:35 -0700 (PDT)
Message-ID: <e725235a77935184cd20dab5af55da95b28d9e88.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: khsieh@codeaurora.org
Date: Tue, 27 Jul 2021 18:44:34 -0400
In-Reply-To: <696a009e2ab34747abd12bda03c103c7@codeaurora.org>
References: <1625585434-9562-1-git-send-email-khsieh@codeaurora.org>
 <87zguy7c5a.fsf@intel.com>
 <a514c19f712a6feeddf854dc17cb8eb5@codeaurora.org>
 <2da3949fa3504592da42c9d01dc060691c6a8b8b.camel@redhat.com>
 <d9ec812b4be57e32246735ca2f5e9560@codeaurora.org>
 <79c5a60fc189261b7a9ef611acd126a41f921593.camel@redhat.com>
 <696a009e2ab34747abd12bda03c103c7@codeaurora.org>
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
Cc: mripard@kernel.org, rnayak@codeaurora.org, tzimmermann@suse.de,
 airlied@linux.ie, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org, swboyd@chromium.org,
 robdclark@gmail.com, Jani Nikula <jani.nikula@linux.intel.com>,
 daniel@ffwll.ch, aravindh@codeaurora.org, sean@poorly.run,
 rsubbia@codeaurora.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

TmljZSB0aW1pbmcsIHlvdSBsaXRlcmFsbHkgZ290IG1lIGFzIEkgd2FzIDIgbWludXRlcyBhd2F5
IGZyb20gbGVhdmluZyB3b3JrCmZvciB0aGUgZGF5IDpQLiBJIHdpbGwgZ28gYWhlYWQgYW5kIHB1
c2ggaXQgbm93LgoKQlRXIC0gaW4gdGhlIGZ1dHVyZSBJIHJlY29tbWVuZCB1c2luZyBkaW0gdG8g
YWRkIEZpeGVzOiB0YWdzIGFzIGl0J2xsIGFkZCBDYzoKdG8gc3RhYmxlIGFzIGFwcHJvcHJpYXRl
ICh0aGlzIHBhdGNoIGluIHBhcnRpY3VsYXIgc2hvdWxkIGJlIENjOgpzdGFibGVAdmdlci5rZXJu
ZWwub3JnICMgdjUuMyspLiB3aWxsIGFkZCB0aGVzZSB0YWdzIHdoZW4gSSBwdXNoIGl0CgpPbiBU
dWUsIDIwMjEtMDctMjcgYXQgMTU6NDEgLTA3MDAsIGtoc2llaEBjb2RlYXVyb3JhLm9yZyB3cm90
ZToKPiBPbiAyMDIxLTA3LTI3IDEyOjIxLCBMeXVkZSBQYXVsIHdyb3RlOgo+ID4gT24gVGh1LCAy
MDIxLTA3LTIyIGF0IDE1OjI4IC0wNzAwLCBraHNpZWhAY29kZWF1cm9yYS5vcmfCoHdyb3RlOgo+
ID4gPiAKPiA+ID4gSXQgbG9va3MgbGlrZSB0aGlzIHBhdGNoIGlzIGdvb2QgdG8gZ28gKG1haW5s
aW5lZCkuCj4gPiA+IEFueXRoaW5nIG5lZWRlZCBmcm9tIG1lIHRvIGRvPwo+ID4gPiBUaGFua3Ms
Cj4gPiAKPiA+IERvIHlvdSBoYXZlIGFjY2VzcyBmb3IgcHVzaGluZyB0aGlzIHBhdGNoPyBJZiBu
b3QgbGV0IG1lIGtub3cgYW5kIEkgY2FuIAo+ID4gZ28KPiA+IGFoZWFkIGFuZCBwdXNoIGl0IHRv
IGRybS1taXNjLW5leHQgZm9yIHlvdS4KPiBubywgSSBkbyBub3QgaGF2ZSBhY2Nlc3MgdG8gZHJt
LW1pc2MtbmV4dC4KPiBQbGVhc2UgcHVzaCBpdCBmb3IgbWUuCj4gVGhhbmtzIGEgbG90cy4KPiAK
Ci0tIApDaGVlcnMsCiBMeXVkZSBQYXVsIChzaGUvaGVyKQogU29mdHdhcmUgRW5naW5lZXIgYXQg
UmVkIEhhdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
RnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5vCg==
