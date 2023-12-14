Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 568A68129E6
	for <lists+freedreno@lfdr.de>; Thu, 14 Dec 2023 09:01:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C0CE10E842;
	Thu, 14 Dec 2023 08:01:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B21D10E190
 for <freedreno@lists.freedesktop.org>; Thu, 14 Dec 2023 08:00:53 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-dbc666461daso4998459276.0
 for <freedreno@lists.freedesktop.org>; Thu, 14 Dec 2023 00:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702540852; x=1703145652; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hxvoxrsdJSPbjJs7z8cGp1BRDLR051KEfgQFlaNlMoA=;
 b=qyNDessnf/xN7kF0JV/5plEloLtwXSpHpzJtWIUfChe+fkaANdep13+Bv/u8nLH6Y/
 9eA75IEv7Dp+7QHg3nVqSACmiN6fXc9iO9W0Ap0UtNtN0c+LXN7PMAbAcsJuuLUMYoin
 kRfstop9rIo5b2gyHbLVLBCe0PwnYX9MPJovD5f6o9E430Cp8tZP+GnXtfDhcXXEacH0
 LWAmzou1dUmay+bYngpwZh4HYixvRRPq85vihPKaFH6OC7kUDLmmQUTV+VDFzv4MAguv
 J2OtYBtAXpG7SOFklBIoMZGCoT7luiVaIZkAuv4XjHB/HmOnoBVQOJn7++yTDF+RJ3xX
 ot2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702540852; x=1703145652;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hxvoxrsdJSPbjJs7z8cGp1BRDLR051KEfgQFlaNlMoA=;
 b=qour2Zv800Tu/Aoh2x5O88ADLp44/LYftPKePcaAJ+P9K5Cd/EBSFS6LJQxMXySrFA
 7FVPmE9FGXg4pAqDHl3QfXo3fxWm7a/4QixYtTWlDBB7Kw9hzmpL3tqS7Zs4v9OMpNVO
 D9sjHK6vnG+G5GhXDfuEDTNvXiAl8wcgXwJa2Ak+Z0mLnyfyTwUZw404iw122ZXzrl+l
 AjuQs/2znSo42l2GaZfnBVQwdr6/s7Fmw1uGVR+z/4L04wVS9sQ6o62WHLMgnhsiUu2x
 1dzdwMV+g89CZPblyg/UBz+zDwM8vRLtQqnMQwWO51jqvmFCA8IgSTpRA+ET91NG5uAj
 fGZg==
X-Gm-Message-State: AOJu0YwfMlg3vA6rTnh+lPrRyKfyn8B3YQUldY4PKOYmJUPK8P5It7sW
 MHQvfZpuvgKpavTJnATdDaQ5dGDGIrA+oh/HXO4vrw==
X-Google-Smtp-Source: AGHT+IEnRsZCGxPZoaC9TlxZCpwZRrhdgilZbD3aUw2tigkOCiLHSxoK/nVPHCaSKjzElObYgpZcrTxqROsqkKsWfYo=
X-Received: by 2002:a25:e20b:0:b0:db7:dacf:6ff7 with SMTP id
 h11-20020a25e20b000000b00db7dacf6ff7mr6738896ybe.127.1702540852537; Thu, 14
 Dec 2023 00:00:52 -0800 (PST)
MIME-Version: 1.0
References: <20231212160448.883358-1-vignesh.raman@collabora.com>
In-Reply-To: <20231212160448.883358-1-vignesh.raman@collabora.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 14 Dec 2023 10:00:41 +0200
Message-ID: <CAA8EJpro5Hb0yRaxPWzBQBikKjw9JnNVkUuPFvWeXjegzCuxHw@mail.gmail.com>
Subject: Re: [PATCH] drm/ci: uprev mesa version: fix kdl commit fetch
To: Vignesh Raman <vignesh.raman@collabora.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: daniels@collabora.com, emma@anholt.net, freedreno@lists.freedesktop.org,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 robdclark@gmail.com, dri-devel@lists.freedesktop.org,
 quic_abhinavk@quicinc.com, david.heidelberg@collabora.com,
 helen.koike@collabora.com, daniel@ffwll.ch, airlied@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 12 Dec 2023 at 18:04, Vignesh Raman <vignesh.raman@collabora.com> wrote:
>
> build-kdl.sh was doing a `clone --depth 1` of the default branch,
> then checking out a commit that might not be the latest of that
> branch, resulting in container build error.
>
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/5efa4d56 fixes
> kdl commit fetch issue. Uprev mesa in drm-ci to fix this.
>
> This commit also updates the kernel tag and adds .never-post-merge-rules
> due to the mesa uprev.
>
> Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/ci/gitlab-ci.yml | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)

-- 
With best wishes
Dmitry
