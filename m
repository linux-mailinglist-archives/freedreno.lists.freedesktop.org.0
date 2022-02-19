Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4BF4BC50D
	for <lists+freedreno@lfdr.de>; Sat, 19 Feb 2022 03:48:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88E6610EB31;
	Sat, 19 Feb 2022 02:48:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BEDD10EB31
 for <freedreno@lists.freedesktop.org>; Sat, 19 Feb 2022 02:48:07 +0000 (UTC)
Received: by mail-oo1-xc36.google.com with SMTP id
 189-20020a4a03c6000000b003179d7b30d8so5877998ooi.2
 for <freedreno@lists.freedesktop.org>; Fri, 18 Feb 2022 18:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=PyXIOt9TwEbp/v0FYGxm9MNyuNqxiXlSYVf9ZjuxFw4=;
 b=oJKjQAjyFAabhbVoxOVOi5vHV8FDmur21OrnA50nLxUxaeTQIO9Gn8MH8iLA9zwARx
 JbEaFp4AZyGac6ERMXofW+N0iycI0+HArqhTgDUUz4kqV7QZNIjMqBoTkDxMMVcdbBR/
 LWzpUpLu8ef6ZliKBQmXgFIRnBNKEmd5s1lGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc:content-transfer-encoding;
 bh=PyXIOt9TwEbp/v0FYGxm9MNyuNqxiXlSYVf9ZjuxFw4=;
 b=PvwEZEk0xnfif0odpvs9yT6U/exJGmn0xTlGlgHkpDQWx71QQNEZZjiZOv9aeltt2k
 MVj2N+wp5MUZTYV0cZInng1VifoLrAcPgsxcDJYPV1THpeOcHn2QdZh5HCMO4Swn5SyI
 +uHeSHLMV4gS+nHzE3WITy1jVOBuLMJnMLNaQjlH6eEZCd5VkWJNuUCd5v1l1+V6hL4I
 gu3s6F5a3Tbz5UQ7LHq1Ht2r/cOM5BR6W7li9vvuXWBguh5ypck7Tlxfn1JAIzvOjYa8
 foIwD0C8KlZfRuyb/cp2bJWRbjvUDxsgP+PaLhzyfwWvYwN3G1T1+cX0dpcAVmpyoTNy
 F/9w==
X-Gm-Message-State: AOAM530Wf7Xbi8R5ggeDpN3US2lsE+8kvT26zIcLoK6qILoRjHbyGJj/
 5tGYzhGfwVrp2a3ggDDesGzM9ukpEzFbjfnWboSudw==
X-Google-Smtp-Source: ABdhPJxF6ayg5xV46awWSK47OeLXup8I8aPWcqCYqQcSqviz24QX5EhDws9kLB+NysyTmubzMScwb+kWup7twjLWS9Q=
X-Received: by 2002:a05:6870:631a:b0:d1:7d97:806 with SMTP id
 s26-20020a056870631a00b000d17d970806mr3843106oao.8.1645238886320; Fri, 18 Feb
 2022 18:48:06 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Feb 2022 18:48:05 -0800
MIME-Version: 1.0
In-Reply-To: <1645133788-5057-2-git-send-email-quic_khsieh@quicinc.com>
References: <1645133788-5057-1-git-send-email-quic_khsieh@quicinc.com>
 <1645133788-5057-2-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 18 Feb 2022 18:48:05 -0800
Message-ID: <CAE-0n529EvPSqGt+XgZipOcSNpyHc6FunuQk_W841hYxWdH2og@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH v8 1/4] drm/msm/dpu: adjust display_v_end
 for eDP and DP
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
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-02-17 13:36:25)
> The =E2=80=9CDP timing=E2=80=9D requires the active region to be defined =
in the
> bottom-right corner of the frame dimensions which is different
> with DSI. Therefore both display_h_end and display_v_end need
> to be adjusted accordingly. However current implementation has
> only display_h_end adjusted.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

Is this not a problem for me because this is set already to something
correct in the hardware?

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
