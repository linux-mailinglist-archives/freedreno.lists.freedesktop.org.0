Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE058E62F
	for <lists+freedreno@lfdr.de>; Thu, 15 Aug 2019 10:24:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B226E8C6;
	Thu, 15 Aug 2019 08:24:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E65B6E8C5
 for <freedreno@lists.freedesktop.org>; Thu, 15 Aug 2019 08:24:19 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id h28so1132898lfj.5
 for <freedreno@lists.freedesktop.org>; Thu, 15 Aug 2019 01:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OQ0EE8KBKUB2wnGR7WI4DHIvan4LQMsfKVjPNCbJp30=;
 b=fVz4vK6MYMt17ROhxTh/llvndEqN8sctAQx4Z5M3gXqbcx+uQM1GuO60hQt7Cj8ETm
 KtDf8pNX/APLK0nXClpL7Nde0HAQfYtYz4R2MUJaiuRzWtZsdUiJpjuNwd3B6IDjcYol
 9oFfNvnJB0zlwyRnOM0iepmXFKMQvd5ReSC7d7U9awQG3ZmoPHsD8Zxpg0hshN3R6ZY7
 DNgFL1539IPGNBkKyxs0fsoDOAQvnw4kfACo8CnuaOm9e4r/g11u3OAWW7BGzFXeZvBp
 76r7F/8sud+rM21M1agiGYdrtWaGwP4DFc8GAO9TXoVPopWITyu8tgcO1OpsLrtsoJVf
 K0cQ==
X-Gm-Message-State: APjAAAUluuhW4ABa+qZZDwVQAJxo3iJR6dK32hOrNRCnUanJRgpOrlOD
 eZswvUiG1zti3NW6xKoslCuUroXLGFJv45IEPH11yw==
X-Google-Smtp-Source: APXvYqwLnc3C4Y4Uj9ggAwakGzpIWkkpLBmK9Z2FcyUqoiL21SA+0DNibnPbsKNQqp+zQbxvlbBPxLQn3oxhDsqLDWY=
X-Received: by 2002:ac2:59d0:: with SMTP id x16mr1894686lfn.60.1565857457973; 
 Thu, 15 Aug 2019 01:24:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190815004854.19860-1-masneyb@onstation.org>
 <20190815004854.19860-6-masneyb@onstation.org>
In-Reply-To: <20190815004854.19860-6-masneyb@onstation.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 15 Aug 2019 10:24:05 +0200
Message-ID: <CACRpkdbZ09+pS+AchWLcxyA9MHgQ2ytL2qN77V3_gKmtw9yFog@mail.gmail.com>
To: Brian Masney <masneyb@onstation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=OQ0EE8KBKUB2wnGR7WI4DHIvan4LQMsfKVjPNCbJp30=;
 b=BtMASVRwCxEESb39swhUi6eKRj6LJ+hlNA4zpwGR2CrCnj90lLF4XUtzeSbcFnkIeH
 Rua8own1u82bzcCfXFA2g1OhlZ09we6lALghTOQaf28IZJU+IPkngEhprVhE11a/ALd/
 FuPpbfhwYsCQ3+XtIUgBR2+NG0zT8OR8sq4KMqI6xllCpkCgmH+NjXOfcYu1jRvB5m2t
 zy7HTL11dzTNin51nsoF+SKMm9VCxW4mlbsGJqLxFdi4VqZNclku0cU3xi/43cIPB0u2
 BjqKpwqDoRkDO4NFdAkrngy7sLiHI2K27UgsJ3yGyv+9WI/hB4kP+K7lDNZOSCG/kSyb
 jKbA==
Subject: Re: [Freedreno] [PATCH 05/11] drm/bridge: analogix-anx78xx: correct
 value of TX_P0
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Dave Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Andy Gross <agross@kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, MSM <linux-arm-msm@vger.kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 freedreno <freedreno@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMjo0OSBBTSBCcmlhbiBNYXNuZXkgPG1hc25leWJAb25z
dGF0aW9uLm9yZz4gd3JvdGU6Cgo+IFdoZW4gYXR0ZW1wdGluZyB0byBjb25maWd1cmUgdGhpcyBk
cml2ZXIgb24gYSBOZXh1cyA1IHBob25lIChtc204OTc0KSwKPiBzZXR0aW5nIHVwIHRoZSBkdW1t
eSBpMmMgYnVzIGZvciBUWF9QMCB3b3VsZCBmYWlsIGR1ZSB0byBhbiAtRUJVU1kKPiBlcnJvci4g
VGhlIGRvd25zdHJlYW0gTVNNIGtlcm5lbCBzb3VyY2VzIFsxXSBzaG93cyB0aGF0IHRoZSBwcm9w
ZXIgdmFsdWUKPiBmb3IgVFhfUDAgaXMgMHg3OCwgbm90IDB4NzAsIHNvIGNvcnJlY3QgdGhlIHZh
bHVlIHRvIGFsbG93IGRldmljZQo+IHByb2JpbmcgdG8gc3VjY2VlZC4KPgo+IFsxXSBodHRwczov
L2dpdGh1Yi5jb20vQUlDUC9rZXJuZWxfbGdlX2hhbW1lcmhlYWQvYmxvYi9uNy4xL2RyaXZlcnMv
dmlkZW8vc2xpbXBvcnQvc2xpbXBvcnRfdHhfcmVnLmgKPgo+IFNpZ25lZC1vZmYtYnk6IEJyaWFu
IE1hc25leSA8bWFzbmV5YkBvbnN0YXRpb24ub3JnPgoKUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxl
aWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWls
aW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==
