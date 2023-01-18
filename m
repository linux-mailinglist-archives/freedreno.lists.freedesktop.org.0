Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 144EE670FF9
	for <lists+freedreno@lfdr.de>; Wed, 18 Jan 2023 02:28:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B9A510E626;
	Wed, 18 Jan 2023 01:28:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E7DE10E626
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 01:28:26 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id tz11so15287943ejc.0
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jan 2023 17:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o8QyhSnzbFdvQ5FvcP2X1YXz8UVWrJ0qZl/VLhR8k68=;
 b=tJuJCTlME1+6oauOK4SU7qRrWBxXoClZTj+bEv/XGHdCWDNFmfF2CILtP+FS+gHRrn
 pE3+Cm718Mwh0TLDGx6s1pocRQG2/MEBFi4Dq69xd0uH0fB5FCRQfdnvxomfaDvf4lOI
 lUlGgatBgxyC0Pwc2l5+8GqAMiPRs+AD6BzqJamU4q4wNTY76o04AWshNdARyT2P70qY
 JzoG323sgz88Jr5yYTplGh+EhRA4ZO9rznDHErfsXHDGGBHfX/+zxR4rL01bjNU6bHR8
 yuHKki+HdciJ8a3ntBBC6Qb/6UxoWC0MIalK4RPTc0kykB0JBxGNVuxJQwSj72DsKlJF
 Ga2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o8QyhSnzbFdvQ5FvcP2X1YXz8UVWrJ0qZl/VLhR8k68=;
 b=6NZY+ZTQPzdfhiIMx8KVj0EBIuVqZJL3j8B2uBAuh/uqJlrJkzqaXJTINpaX9hTu6q
 EOlKKfDjg//t2xzSH1Bh5xDCsH98xG2WpZAk5XTudjCFidenP+IK4M4ZeHdaPgmHhgF4
 lSvV2CLFrwjEMZsI6ovjMuoF+yT1J46FU7T5ovmvsH/hA3D0tgY4YVWkYVbo5z1FwLzP
 5WrE/xE1TaYq1YzJQGW1J4GjdYKqRv0M393/adsm1fFwcNwOilZom0bsEcGxXDy0qOp4
 q71VFT6EQbTIOG8+evbW2sMxt6JYz38dDy30LTdk7RcvYaT77nnJI/tqNc2jMH1G0QtF
 Swxw==
X-Gm-Message-State: AFqh2kqlMa0KRqpIyHRhk7mzAQnM2psGltWHkmSsuQtfzXo9lyTFrvYJ
 nryeZNPpozJ5OWVSIgxL7CQhdQ==
X-Google-Smtp-Source: AMrXdXt95F0POe56gcMKmWh647lKMiS0QfbK44kq6hQKEpNhP5zhV1YME0/5F4Nz9KPGga+FxIS3MQ==
X-Received: by 2002:a17:906:6843:b0:86c:a3ed:1442 with SMTP id
 a3-20020a170906684300b0086ca3ed1442mr5296523ejs.4.1674005304769; 
 Tue, 17 Jan 2023 17:28:24 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 bn11-20020a170906c0cb00b0087132e779b3sm2835803ejb.224.2023.01.17.17.28.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 17:28:24 -0800 (PST)
Message-ID: <7f3a02a5-53d0-4374-6f9b-894b1140da06@linaro.org>
Date: Wed, 18 Jan 2023 03:28:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1672193785-11003-1-git-send-email-quic_khsieh@quicinc.com>
 <1672193785-11003-3-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1672193785-11003-3-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v6 2/2] drm/msm/dp: enhance dp controller isr
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 28/12/2022 04:16, Kuogee Hsieh wrote:
> dp_display_irq_handler() is the main isr handler with the helps
> of two sub isr, dp_aux_isr and dp_ctrl_isr, to service all DP
> interrupts on every irq triggered. Current all three isr does
> not return IRQ_HANDLED if there are any interrupts it had
> serviced. This patch fix this ambiguity by having all isr
> return IRQ_HANDLED if there are interrupts had been serviced
> or IRQ_NONE otherwise.
> 
> Changes in v5:
> -- move complete into dp_aux_native_handler()
> -- move complete into dp_aux_i2c_handler()
> -- restore null ctrl check at isr
> -- return IRQ_NODE directly
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_aux.c     | 95 ++++++++++++++++++++++++++-----------
>   drivers/gpu/drm/msm/dp/dp_aux.h     |  2 +-
>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 12 ++++-
>   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
>   drivers/gpu/drm/msm/dp/dp_display.c | 16 +++++--
>   5 files changed, 89 insertions(+), 38 deletions(-)
> 

Stephen, Dough, do we still want this patch in?

-- 
With best wishes
Dmitry

