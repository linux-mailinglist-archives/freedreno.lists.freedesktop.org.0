Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5645D8E60B
	for <lists+freedreno@lfdr.de>; Thu, 15 Aug 2019 10:17:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 175616E13F;
	Thu, 15 Aug 2019 08:17:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D82CD6E13F
 for <freedreno@lists.freedesktop.org>; Thu, 15 Aug 2019 08:17:51 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id n19so1092445lfe.13
 for <freedreno@lists.freedesktop.org>; Thu, 15 Aug 2019 01:17:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Hw7jSAIgwN+rABLfqVTMGBvkTFu0H8DfDB1Vzehui0E=;
 b=fjLvMQpEntfKmBIhnOusVboXnjrmpfJOSK2WxHVApZCaKUEjxwIalgae5IXfYz8apN
 AhUikfPZSNhb1cMGHsLgHPPv3SLNEKID0nYC/4sjGg027NImATeVLWGlcF5R+nwEM/7V
 PWDDXrQsWWAJZHeyQXbk2PChrtudgUKXgYCikHMsjRu9ANPpxxPwnh/hcpyMHP9/XMq7
 XY/7oN28rryZF3oTGFiRAhg73j2TMhYEWRT7LwVqnxoLPBbTzpRYbbgJoH5wIsSC17mm
 sgieOWLhmX8SLo8iMuFOBtvbp5pOqPU2CNxI7ZLDhnv2f6uUzoFrmBbkHISFRtev7Us4
 4DpQ==
X-Gm-Message-State: APjAAAUaPTrQivz+WGU6DoHyhl//tB5zmVPSEloT/WA6fk7p7WeyQCUO
 nYxOuK79k5w8ldSnQ7cri7pj6qgYet8KB0KcD3Pvww==
X-Google-Smtp-Source: APXvYqxPxwQsBMfk/OX+yJdpAw36qGQSyoTJ+sTX7VpaAD6F51EWmcwNavIJr21um/O+pXUWt7FUxh9EGojVVK0Hj5o=
X-Received: by 2002:a19:ed11:: with SMTP id y17mr1749758lfy.141.1565857070180; 
 Thu, 15 Aug 2019 01:17:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190815004854.19860-1-masneyb@onstation.org>
 <20190815004854.19860-2-masneyb@onstation.org>
In-Reply-To: <20190815004854.19860-2-masneyb@onstation.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 15 Aug 2019 10:17:38 +0200
Message-ID: <CACRpkdZxSPutW1QNkYQ-T8cVFQDbVBcVyQM00g_8_i8WiFEMDQ@mail.gmail.com>
To: Brian Masney <masneyb@onstation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Hw7jSAIgwN+rABLfqVTMGBvkTFu0H8DfDB1Vzehui0E=;
 b=R/3iJHmXmu4t2d6jYnZwXJFu7xRlQdiL0AFbNMTP+brJ+S84E6ruCuGVEBHQti/gRa
 38IeRutQH5E/LECRnqD33FqoSANwovOb/qZv0fv+uD6lZPVvKAIJnzwnLhqnbWNalp04
 +b0bDrWP8WZJ3EuCIB2Oz/uoLFeRv+Ib/cLyqBIbO9EJiksmb7SWopg3EKVlK+X4FVYr
 V/Y4E3ctoixt9AZibQ30MYyLa1t8aSkQ+pJ9Gg69+XCyeccigxKZ8/JNYwY3HhgxcJHz
 ZMkoV9yd2MoGlIfF+OX7OcmShgcxNw2DqDwRPCskd1Mxe7jWF/6AKEJbgip4dylfABTj
 QngA==
Subject: Re: [Freedreno] [PATCH 01/11] dt-bindings: drm/bridge:
 analogix-anx78xx: add new variants
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
dGF0aW9uLm9yZz4gd3JvdGU6Cgo+IEFkZCBzdXBwb3J0IGZvciB0aGUgYW5hbG9naXgsYW54Nzgw
OCwgYW5hbG9naXgsYW54NzgxMiwgYW5kCj4gYW5hbG9naXgsYW54NzgxOCB2YXJpYW50cy4KPgo+
IFNpZ25lZC1vZmYtYnk6IEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0YXRpb24ub3JnPgoKUmV2
aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KCllvdXJz
LApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVk
cmVubw==
