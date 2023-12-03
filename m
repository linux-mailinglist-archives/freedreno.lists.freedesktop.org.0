Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF84B8023A6
	for <lists+freedreno@lfdr.de>; Sun,  3 Dec 2023 13:16:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99E3D10E2C3;
	Sun,  3 Dec 2023 12:16:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A254910E180;
 Sun,  3 Dec 2023 12:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1701605741; x=1701864941;
 bh=zeJoJaDEd/VJIzT04Xj0cuJGWNQ8PVAG6G1sblS0Nyw=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=gzlNXqtxmiGejNIfLz4esavOMLl5pQMwwYqxpB6F06RkVWa7dI3Ipy7d5+RH1d3Xu
 5tHOtT5oO7Ya+pH2qxH/nmZVE21DQhJWuc+smqr0GtBdMh5vfwZF1kkCIJYevA4WAY
 E+7wVJ2bhKk06PAGYgHLlxZZ9tB7WmkOm7/67+KFbFiFJvKf78OY44GmVi7aSN0dMS
 cbpjNrEc+mzbir0n63jbEcTrwlSPqay9EB4jgT3epqZdb3+zplMiWXjE6Maq940gqC
 l4wIW6+AQa3MiBMwS/e7tOvEJ5n5+qJq06i9FDwK3FtHWBQq/wS5GYJlUuGcA4z3ff
 dDupDPAFHgLIg==
Date: Sun, 03 Dec 2023 12:15:32 +0000
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
From: Simon Ser <contact@emersion.fr>
Message-ID: <OiX1EToyQ0JBECS-Vs6IOw1vqLTt42PYkTlTCBhsPUi-VXC2UoLjkRfEW-OFucxsTqz93Q3IIXZZ3Lw_Lqs1dFt4YbuFSUGrKfDPnnKDCbw=@emersion.fr>
In-Reply-To: <170155324921.2215646.4829699354481827834.b4-ty@linaro.org>
References: <20231027-solid-fill-v7-0-780188bfa7b2@quicinc.com>
 <170155324921.2215646.4829699354481827834.b4-ty@linaro.org>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] (subset) [PATCH RFC v7 00/10] Support for Solid
 Fill Planes
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
Cc: dri-devel@lists.freedesktop.org,
 Sebastian Wick <sebastian@sebastianwick.net>,
 laurent.pinchart@ideasonboard.com,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, ville.syrjala@linux.intel.com,
 sebastian.wick@redhat.com, wayland-devel@lists.freedesktop.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Harry Wentland <harry.wentland@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 quic_abhinavk@quicinc.com, Maxime Ripard <mripard@kernel.org>,
 ppaalanen@gmail.com, Sean Paul <sean@poorly.run>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Saturday, December 2nd, 2023 at 22:41, Dmitry Baryshkov <dmitry.baryshko=
v@linaro.org> wrote:

> On Fri, 27 Oct 2023 15:32:50 -0700, Jessica Zhang wrote:
>=20
> > Some drivers support hardware that have optimizations for solid fill
> > planes. This series aims to expose these capabilities to userspace as
> > some compositors have a solid fill flag (ex. SOLID_COLOR in the Android
> > hardware composer HAL) that can be set by apps like the Android Gears
> > test app.
> >=20
> > In order to expose this capability to userspace, this series will:
> >=20
> > [...]
>=20
>=20
> Applied to drm-misc-next, thanks!

Where are the IGT and userspace for this uAPI addition? 
