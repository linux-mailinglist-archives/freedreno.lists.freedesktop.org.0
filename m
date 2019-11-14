Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A59AFD18B
	for <lists+freedreno@lfdr.de>; Fri, 15 Nov 2019 00:26:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 631FB6F37D;
	Thu, 14 Nov 2019 23:26:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D4E26F37B
 for <freedreno@lists.freedesktop.org>; Thu, 14 Nov 2019 23:26:32 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id d6so6507114lfc.0
 for <freedreno@lists.freedesktop.org>; Thu, 14 Nov 2019 15:26:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dh355UxLWVUsAWtwLkdueim4hUviJNMSeVlOVRSiyyU=;
 b=LE1fvhKj7qyGA+z19VIPGRmCyUTMDWz84DG8yHHDbny5kgZjwDjWa7sarpAw3BaIfu
 fsWELD1TpBAFydsJxsCtvLBVawmYUTR8tgpBkCWJy78Q7m5dZLKWZzQEBVRCdjib83sv
 z2qyeHZOm07cJBrxDRQ+q6Q8QeLMZbIvk4w3eshacQTTuW7hBfEX9dqsx+VWjci5X93+
 NUfKSKpQTCdxcEhm4ZitiMpVSfhWNM/wz7KfPFMTR8tBgzskOpyU1zpPZFmyeFPx91C2
 Qf8SdMb60/to0AOvE8a5crLFHEDuZs1mOmQYYATWtlomdYDGQDg3WWnV5Zi9/M9hFUbB
 OlGg==
X-Gm-Message-State: APjAAAVkksbh4rxxwnshAKXEoxgN2T+o80fK1vhxCK/dxaluMxWl+PSv
 CY6E597P2InUFavTc+RoakqFf9obWia9rwHSpqP8dw==
X-Google-Smtp-Source: APXvYqzLk+KhD3Sj2zIb1agtuRx8FqBh+eeYu3cNtIavQb53WVkpwyRNOE71sOo8/sYqRoHw9clCFk4qt3Trn3pUKVk=
X-Received: by 2002:a19:651b:: with SMTP id z27mr8714521lfb.117.1573773990709; 
 Thu, 14 Nov 2019 15:26:30 -0800 (PST)
MIME-Version: 1.0
References: <20191114185152.101059-1-robdclark@gmail.com>
In-Reply-To: <20191114185152.101059-1-robdclark@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 15 Nov 2019 00:26:18 +0100
Message-ID: <CACRpkdYwBp59wGPbs4+4rNmYPJMXDF0g8qbmhf3_XDHAmFkjcQ@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=dh355UxLWVUsAWtwLkdueim4hUviJNMSeVlOVRSiyyU=;
 b=fsPJNeng02AwnnNHtwtXoe3riey1s/OJrERM+5JLecji6GA9zq4JM5sHWvCJyNKnWC
 6xvVpy3wgwf6hGgp3N3H+WuDv2r8poG8kCEbS5fXQkeIZ3eugGRcYDmTu6nCr9g/hqW8
 GyeJopyeU9cHUKn7On5e4xnwapZTvRaUCO9Xq533CLFKtNyceG8bg2DwwTb7FPPgzTJ8
 wVKTtqRx7FUrs9cUbhUP/RwggYxF5sy0lwWOeRytpjajYFmsTO+KX+VqTQf6LJFkpIp3
 aNoAjxE448K3Tj09rXpE55JYCFFKXJlCLZd2+sVubjWjTJ1odWk3FpoPjoDu7D52yTqh
 gZpQ==
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: ignore NULL clocks
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, Alexios Zavras <alexios.zavras@intel.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Jordan Crouse <jcrouse@codeaurora.org>,
 Matthias Kaehlcke <mka@chromium.org>, Mamta Shukla <mamtashukla555@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMTQsIDIwMTkgYXQgNzo1NCBQTSBSb2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFp
bC5jb20+IHdyb3RlOgoKPiBGcm9tOiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+
Cj4KPiBUaGlzIGlzbid0IGFuIGVycm9yLiAgQWxzbyB0aGUgY2xrIEFQSXMgaGFuZGxlIHRoZSBO
VUxMIGNhc2UsIHNvIHdlIGNhbgo+IGp1c3QgZGVsZXRlIHRoZSBjaGVjay4KPgo+IFNpZ25lZC1v
ZmYtYnk6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KPiBUZXN0ZWQtYnk6IE1h
dHRoaWFzIEthZWhsY2tlIDxta2FAY2hyb21pdW0ub3JnPgoKUmV2aWV3ZWQtYnk6IExpbnVzIFdh
bGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KCllvdXJzLApMaW51cyBXYWxsZWlqCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBt
YWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==
