Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC1780A20C
	for <lists+freedreno@lfdr.de>; Fri,  8 Dec 2023 12:21:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8523110EA73;
	Fri,  8 Dec 2023 11:21:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4443D10EA7B
 for <freedreno@lists.freedesktop.org>; Fri,  8 Dec 2023 11:21:08 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-db4364ecd6aso2006716276.2
 for <freedreno@lists.freedesktop.org>; Fri, 08 Dec 2023 03:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702034467; x=1702639267; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rmazC+0qAqQxSPROFc0xc84GbFdhI8sWUlQpFJfzTOs=;
 b=nB/IhqLNC/d8kwqLViGvj2Ju5r+Dp377mRR+ahmJ/goVj0NrdLusCWHz0UI22yrjjZ
 damZgWcYGadGLcWJaR6h0ZB1ZLgvCSf3Zc0QIOR+is3BbRTuRGteRuT04UUcqN6MOouG
 NaoBXMC53IJUj73bxI2OBdeQ+ifjvEm+LfvkcN+2Gp5VXOrC2f8UKnO2VwmlpwWdDAYD
 8SJjVkybXk4jL2a4p2GVUClv2odRd1JNrid+ASry39c4vmIlSLUUgs99X3ekPaSFDNYt
 iCwCN6V87Vr8lR1hhlEcwYrSMqzUQBIXviCJKDaOJI+9zcHjFpbtxyoh+ZqD9HTxhNfQ
 EAFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702034467; x=1702639267;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rmazC+0qAqQxSPROFc0xc84GbFdhI8sWUlQpFJfzTOs=;
 b=eXIqDW4hUc2Gh0vZUo+8L0T2V5DiYSQYAKf1R8M0r5/WnelfLf2h9YnsuosDsAE1WR
 B4jvLIOLesNjLDcRmkcnpWYRaZH8m+ZJJS5/qcJrxo2OOsUp0DsWwhctn+WDLtr4Hm7n
 iSszh6arKatcg0rI4YJ28BMB1hUxM9uYF1D3G2g19ntOsT7NIjTmsdWzJfQN1zjILUp+
 uJN9wXuwPlI2gc7pMlmrCt8GqQnUU/NEM50qvvwkt7LfuqnUNzkeu06jMZqOn6gUfA08
 3DDryBJgMopKqwSyoR0H+yj2Dw66+G8b40tA7P7m9Kht4l/Y0vZjV4wGr2SYez2jNGMG
 EsPw==
X-Gm-Message-State: AOJu0YxPtjmYWmrNNSTZZ9JjWwrH8ddU7ikFUmg0lx1XdM9+KXEWKdxN
 waoy5DnWZZVfD0/3cWzRCC43Yq1RNH5vJob5fGNk6w==
X-Google-Smtp-Source: AGHT+IHp0377Ybzxt5w6KqA9E+DZI6lyM8tdxkXwFiDkF9togYRg3F/ti2mcvG9rIQBDUE40O7+YuoHQA1vFqx87rvE=
X-Received: by 2002:a25:2f96:0:b0:db7:dacf:4d66 with SMTP id
 v144-20020a252f96000000b00db7dacf4d66mr2502085ybv.98.1702034467396; Fri, 08
 Dec 2023 03:21:07 -0800 (PST)
MIME-Version: 1.0
References: <20231208050641.32582-1-quic_abhinavk@quicinc.com>
 <20231208050641.32582-7-quic_abhinavk@quicinc.com>
In-Reply-To: <20231208050641.32582-7-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Dec 2023 13:20:56 +0200
Message-ID: <CAA8EJprAu-4Az07oztew0Nf3SO1yeCcASk2bhXR-938YnzSgMg@mail.gmail.com>
Subject: Re: [PATCH v2 06/16] drm/msm/dpu: add cdm blocks to sm8250
 dpu_hw_catalog
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, quic_parellan@quicinc.com,
 Daniel Vetter <daniel@ffwll.ch>, quic_jesszhan@quicinc.com,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 8 Dec 2023 at 07:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Add CDM blocks to the sm8250 dpu_hw_catalog to support
> YUV format output from writeback block.
>
> changes in v2:
>         - re-use the cdm definition from sc7280
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
