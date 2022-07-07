Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C7756AF29
	for <lists+freedreno@lfdr.de>; Fri,  8 Jul 2022 01:56:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63EC010FAC3;
	Thu,  7 Jul 2022 23:56:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
 [209.85.161.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0527F10FAC3
 for <freedreno@lists.freedesktop.org>; Thu,  7 Jul 2022 23:56:06 +0000 (UTC)
Received: by mail-oo1-f46.google.com with SMTP id
 m26-20020a4abc9a000000b00425cd321033so3754735oop.10
 for <freedreno@lists.freedesktop.org>; Thu, 07 Jul 2022 16:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=9ntP1WDLnC6Yx7jFk7jZStLEDziwDqk+ZlwPsvE1xWs=;
 b=bXuaYmps3SO/5Gg3nxuV379NqM1hoHcyQbvWn/KnsI4akOLpYz+plOpnE5dn9mRH7Z
 Ba4pUy+ktATqZI/NUhKueHyeRHspJaPiUIEewUlCm9RQVmwSizU1Qt7YSZVn+1svIEIs
 iVy1O+bxNmKs1ULMXdsz6tbhueBjHT39Ggtcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=9ntP1WDLnC6Yx7jFk7jZStLEDziwDqk+ZlwPsvE1xWs=;
 b=GLY2jMPQ+g3mupk6vNEkeuZF0z9hsPvdg6rZ4qmhgF+ocVU6xzQc5I5GMmhJfXJNUN
 wHnXIPvvbtDEr6K9w0t4s+e3c45rDNOaxx+Ix9GURN6SwUKjMBIt4AFq7ukavNa3znFL
 213MLCSC9qvkTvnNdAgYaeL6nFA0dM0YAnndHJJd5nw/wkaUwohWO80KhKTxCH3OFM7j
 fTZQuOMS27A0z2XiUNImsRvtRcND1IcNr4tvZRgwAivpgXhqrYOseHigT1fe2ztZ5aFa
 wxlmDTnyjuuxcVm3nAxjvn2S07InQY5fAyGa+7N94ZNYkPBbKBIEITNULVnKhtAKVEEz
 WgGg==
X-Gm-Message-State: AJIora/ukl5Rz8EnI/zkVjkv0YWcKKVFJgdii+15zT2xIVHTaXoMr2UY
 /QxvT++zojsTv4CxXGClM1UnY2YjS00xA5I/wARmxA==
X-Google-Smtp-Source: AGRyM1s5aRJwu3pF2TR9+JflN9Xt6rSHUQxPIdyIsKnn5I3uBjzRJFONFzrC6JiOmFqLVKBgHodXNbkvtUIvE0e4ebU=
X-Received: by 2002:a4a:81c1:0:b0:425:b01b:f757 with SMTP id
 s1-20020a4a81c1000000b00425b01bf757mr305054oog.1.1657238106090; Thu, 07 Jul
 2022 16:55:06 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Jul 2022 16:55:05 -0700
MIME-Version: 1.0
In-Reply-To: <1657135928-31195-1-git-send-email-quic_khsieh@quicinc.com>
References: <1657135928-31195-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 7 Jul 2022 16:55:05 -0700
Message-ID: <CAE-0n506RwOi8xqVEAaLjfhb3vey7R2FF_72_F-nmgrXrP6RWQ@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v4] drm/msm/dp: make eDP panel as the first
 connected connector
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-07-06 12:32:08)
> Some userspace presumes that the first connected connector is the main
> display, where it's supposed to display e.g. the login screen. For
> laptops, this should be the main panel.
>
> This patch call drm_helper_move_panel_connectors_to_head() after
> drm_bridge_connector_init() to make sure eDP stay at head of
> connected connector list. This fixes unexpected corruption happen
> at eDP panel if eDP is not placed at head of connected connector
> list.
>
> Changes in v2:
> -- move drm_helper_move_panel_connectors_to_head() to
>                 dpu_kms_drm_obj_init()
>
> Changes in v4:
> -- move drm_helper_move_panel_connectors_to_head() to msm_drm_init()
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
