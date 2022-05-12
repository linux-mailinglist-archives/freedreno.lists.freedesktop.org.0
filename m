Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D88FB52414B
	for <lists+freedreno@lfdr.de>; Thu, 12 May 2022 02:02:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2557610E791;
	Thu, 12 May 2022 00:02:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A386D10E74F
 for <freedreno@lists.freedesktop.org>; Thu, 12 May 2022 00:02:37 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 s12-20020a0568301e0c00b00605f30530c2so1570075otr.9
 for <freedreno@lists.freedesktop.org>; Wed, 11 May 2022 17:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=j1qyiWWc/ZcMZ2FZH7DVJCATZ7B7pTYmubNqnjOuM24=;
 b=kE6d/j8BCN5rbO1FcyurymCrlhWhcqgGf+VT5p9sG53nurd5HLHT4BV4+N8p0dHLke
 YzBkNh/pVk8OQNKM8FEMkLqvXRSqrVDmeiXgN+F8TA0yvYsEHd6TQ04nCn0B3xCg05WC
 HlBoHOwmVOA5rU/Crk5bnEUPUuzTknAg9nBiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=j1qyiWWc/ZcMZ2FZH7DVJCATZ7B7pTYmubNqnjOuM24=;
 b=Gm9JpZo2Sz2kx7A2VedUwjpx3hE7f6rbLZ48TGdTk9aeA1dawjvneEN0dz0JSoDWjy
 ho1C79hUOOk7H8182oiINJRtSessPmcy99OD1jjibtWvFFkW915XruhvixifFsncykHR
 pucEuaKjVjIQlzhqmerdV5sC2bhp/aDvmZJ8Mvj8L3wMK+gsVgeZWf+gOJp9POCd8iSb
 DxLXnyNuETp4l6ZK12I8RX0P/+sJH/fSyTwMz4YLqvyfHImHj2+fctYivZR3/rJ9iHAq
 yM4omSWQQ8p2jiZSmsGr3B6ILiDrixt1cthNrtwfhfwAgwIfw6l9w85pgLZFPhN2zGQM
 O8zA==
X-Gm-Message-State: AOAM532JBO1JrTlXRXt/VYj4OdZCVvDx6EUb9Ipu7cIJNAgQNIv4CNIU
 7Tfc5b+j2zm1nMJtQvV+cP4GRICthEY1gBeC6Ph4Xw==
X-Google-Smtp-Source: ABdhPJzhIap2jPse6o+R+wgLrc8xRp1X48y3KB07+7qJgfflkLe85OdZ/njzLrDPNjlZ/HaPZU9Pus9j1oV3TMksJCo=
X-Received: by 2002:a9d:63cd:0:b0:606:9e7f:79f8 with SMTP id
 e13-20020a9d63cd000000b006069e7f79f8mr5629866otl.77.1652313756970; Wed, 11
 May 2022 17:02:36 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 May 2022 17:02:36 -0700
MIME-Version: 1.0
In-Reply-To: <20220511222710.22394-1-quic_abhinavk@quicinc.com>
References: <20220511222710.22394-1-quic_abhinavk@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 11 May 2022 17:02:36 -0700
Message-ID: <CAE-0n53SDYFiSGkcUW=DbmGOZe3oz9AjSATtcmbKqKh3=Pn9jw@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: add DRM_MODE_ROTATE_180 back
 to supported rotations
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
Cc: quic_kalyant@quicinc.com, dri-devel@lists.freedesktop.org,
 quic_khsieh@quicinc.com, robdclark@gmail.com, seanpaul@chromium.org,
 daniel@ffwll.ch, dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com, quic_vpolimer@quicinc.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Abhinav Kumar (2022-05-11 15:27:10)
> DRM_MODE_ROTATE_180 was previously marked as supported even
> for devices not supporting inline rotation.
>
> This is true because the SSPPs can always flip the image.
>
> After inline rotation support changes, this bit was removed
> and kms_rotation_crc IGT test starts skipping now whereas
> it was previously passing.
>
> Restore DRM_MODE_ROTATE_180 bit to the supported rotations
> list.
>
> Fixes: dabfdd89eaa92 ("add inline rotation support for sc7280")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
