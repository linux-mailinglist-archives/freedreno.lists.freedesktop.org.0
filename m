Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 967AD54FE89
	for <lists+freedreno@lfdr.de>; Fri, 17 Jun 2022 22:53:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B18A112537;
	Fri, 17 Jun 2022 20:53:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18CE1112528
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jun 2022 20:53:08 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-fe4ac3b87fso6941299fac.3
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jun 2022 13:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=pOJ0w1fx8TDvU6Wqqk+kju4f/j2XWysLUuPMKoQ93WQ=;
 b=BCibZwkwaWdmHbyckK1itupaySjS2gpljASTEwZsgmFNvWfcv7hFIh0Q6nCCPGNLjx
 /i/TFOrHBgEmtJlicNOVI2xEFcbx0/J45Y/oeZcqipsroldorlI8/h02GBcyDQ/k7b5d
 a019+LDOh4MT5bMtUHPCY/jUDuG4Zea/gCL30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=pOJ0w1fx8TDvU6Wqqk+kju4f/j2XWysLUuPMKoQ93WQ=;
 b=rDwZoy6b4DtufizpLIK2KJLRb7MAUBxD+KL9IiDdeeBeUfw6f5PoiWpBpaBD4W0Knk
 qQx5hV45gr4PJIP0lfGwUjhIbnHHnvlc4dzTu47iooi1hrIvVyJoKTHGgVjcPFapgNcq
 E3uIywK6d8UNBIVQbrb6GAi8soBhvQ9Hen1UglthwIMuFegQkzuTFYaHn2hpQJVnyhpF
 2TbSekG/c+jKDf66PvaYzYMWarhJBRrqoHeTDiB6eqTDVNFMla39Xi8tgDVLy7kZL+mM
 tq6WpfYjPow2KsABjElTLfM4qOW/JQJ7ibreDKPIjbXanDrEME0StFXgchTc+yKqO7rD
 NaPA==
X-Gm-Message-State: AJIora8EjmrX1sGL+mfAdg/jPpLDxix+dcBLVvXWF4m9x6D+8NIGVDRI
 /SpSb7t04vxjY/8Lebisr8f3kVlSBQx42pYXAM4Gzg==
X-Google-Smtp-Source: AGRyM1tHrKeZbF6x4Ph4v2TGhIyG5/H7CB4DpNOnp0o8Y+JdhKEu01LNai/uLjNuxsjXcEVC20rNgdoz+JZY07qm7Bc=
X-Received: by 2002:a05:6870:b48a:b0:101:40eb:63a3 with SMTP id
 y10-20020a056870b48a00b0010140eb63a3mr6279169oap.193.1655499187407; Fri, 17
 Jun 2022 13:53:07 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 17 Jun 2022 13:53:07 -0700
MIME-Version: 1.0
In-Reply-To: <20220616085054.432317-1-dmitry.baryshkov@linaro.org>
References: <20220616085054.432317-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 17 Jun 2022 13:53:06 -0700
Message-ID: <CAE-0n507ro+ZDAi8eoYbXjuxeT8SB-viCbr3Fh3x9QN56UTLrQ@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/hdmi: drop empty bridge callbacks
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
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-06-16 01:50:54)
> Drop empty callbacks msm_hdmi_bridge_enable() and
> msm_hdmi_bridge_disable().
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
