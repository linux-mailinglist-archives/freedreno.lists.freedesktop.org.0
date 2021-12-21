Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3828147BE2B
	for <lists+freedreno@lfdr.de>; Tue, 21 Dec 2021 11:33:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BFD210FCFD;
	Tue, 21 Dec 2021 10:33:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C41910FCF9
 for <freedreno@lists.freedesktop.org>; Tue, 21 Dec 2021 10:33:05 +0000 (UTC)
Date: Tue, 21 Dec 2021 10:33:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1640082782;
 bh=pXB8OtEXG/jGofY2Qa9yUBavX37a5hZrYWvWrLa5VZU=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc;
 b=xBoRwSPd+6DJPTYCvqswpH6Dq8sR6EItvUj6RLNR6dgugH8pxKLemZgoR1PEzbSM1
 I/ByCdUHEYd6KlydLypN7g4JoZWdmIvg53M7d5ViyoqBbNvjszgAtd+fQ8OW/AwgMr
 o8OgNADy0hDEoD1i8jlo6Sf9/FPzOqyWcLzHt4rlxyvTygBp5y3unVsLXSPTWuhIQ3
 HQvctBehocbc9XKtTTQ3MXb8lk4EsMo3ey2R5SP3NDzEF6hs6PUz2NzlcXemS42Vpf
 n+aX9BhuyA9OnpIpxbOQsVi/b9EPOEURm2Lr2vgHXMxGFc14vjTE7Y0NB1374cJHle
 rqxXkFL6adAow==
To: =?utf-8?Q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>
From: Simon Ser <contact@emersion.fr>
Message-ID: <goOOXRPhPVm7JnHxD3xB6AeyPfmtyR9whCUnuDXyKv1uhyy1cAUJimC-ITTEFI2m8AUuINYGRViCjFVavsXEKy4PILOJiGM_0031fi900tw=@emersion.fr>
In-Reply-To: <20211221101319.7980-2-jose.exposito89@gmail.com>
References: <20211221101319.7980-1-jose.exposito89@gmail.com>
 <20211221101319.7980-2-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
Subject: Re: [Freedreno] [PATCH 1/3] drm/plane: Mention format_mod_supported
 in IN_FORMATS docs
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: sean@poorly.run, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, jernej.skrabec@gmail.com, tzimmermann@suse.de,
 wens@csie.org, freedreno@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, maxime@cerno.tech
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Reviewed-by: Simon Ser <contact@emersion.fr>

Please ping me in a week or so if nobody objected and this isn't merged.
