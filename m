Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BDB4CC7C5
	for <lists+freedreno@lfdr.de>; Thu,  3 Mar 2022 22:16:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F99E10ED19;
	Thu,  3 Mar 2022 21:16:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA44110ED19
 for <freedreno@lists.freedesktop.org>; Thu,  3 Mar 2022 21:16:53 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 j7-20020a4ad6c7000000b0031c690e4123so7211844oot.11
 for <freedreno@lists.freedesktop.org>; Thu, 03 Mar 2022 13:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=eBRpf0i/hx08EbAhrJon0eI377sVgFylnKUzTw3G8q8=;
 b=Y1noj0CZkDChL6WDH0DFVnqalSjczZxzPiFZ0aeG9zYus0XaN6W0E0c+xiS47WsUTD
 ZgMe8dZXS/qf/ONhNPJR4f1+nbsghpw7hKXWIuCZ2dI2eZgfich2+2SlwJUaZZCyE95W
 Uc9E55tWfiKT76d6Z0xLVxVmKTccsfJXDXIec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=eBRpf0i/hx08EbAhrJon0eI377sVgFylnKUzTw3G8q8=;
 b=h39oaIhor+5U9Q07Mm7eRbEgmBiupHO5TxhvSB3shTygAo8sjjYPplUl/Y440bRS6k
 C+OkLt8S6FKAg7H8rqbPnGhyVAS3RfKZPGgwHaRhx605Z1D0QrcCnE7o9Xr7bRh9+fAD
 4CB8PiATkPk41peg10worRD7hZ/P40CsPV4SrS3OE5LZAfp7FFPnD0rKVx5ZtquSO2xC
 k1/Gl1gbfgmxUEluRNtKYWUa2WvzVAQAZWZw1En6BOu//3tbXDvoFzvyZxzL6qdoQy0e
 FYEl05Ss3nyleWwGYUMulWHkb/3YCxIJmN+EqNeHrOzBzY8kOIVoAoFPKCJyt/y8wqhD
 vMlQ==
X-Gm-Message-State: AOAM5326n1LaDtX3UGsRG25wUUy5SC8gBSxpnkp2Z2Ic363q4tuQp9mv
 YTPJZ/m3vJPnQHqXffQaIVcN8vWYQOPwxV6CjRQyNg==
X-Google-Smtp-Source: ABdhPJycDTkb12wMHQabG8QDoujORlwb5yF7X0CE3x/kQihq3Ki7wuKuov+4lGz1lU8+V2cIfN0D2vjvseXYvTdgcQo=
X-Received: by 2002:a05:6870:3c18:b0:d7:22ed:20b0 with SMTP id
 gk24-20020a0568703c1800b000d722ed20b0mr5555933oab.32.1646342213146; Thu, 03
 Mar 2022 13:16:53 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 13:16:52 -0800
MIME-Version: 1.0
In-Reply-To: <20220222062246.242577-3-dmitry.baryshkov@linaro.org>
References: <20220222062246.242577-1-dmitry.baryshkov@linaro.org>
 <20220222062246.242577-3-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 3 Mar 2022 13:16:52 -0800
Message-ID: <CAE-0n50ANGE0gQ6My2eXR4jhp5ivU6kvRcFCoUmmZ1rEoUT9UQ@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 2/4] drm/msm/dpu: drop INTF_TYPE_MAX symbol
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-02-21 22:22:44)
> This enum value does not correspond to any of actual interface types,
> it's not used by the driver, and the value of INTF_WB is greater than
> INTF_TYPE_MAX. Thus this symbol serves no purpose and can be removed.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
