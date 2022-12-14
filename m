Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E66C864CF96
	for <lists+freedreno@lfdr.de>; Wed, 14 Dec 2022 19:42:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9621810E44F;
	Wed, 14 Dec 2022 18:42:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F01A010E44F
 for <freedreno@lists.freedesktop.org>; Wed, 14 Dec 2022 18:42:12 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id g7so11975721lfv.5
 for <freedreno@lists.freedesktop.org>; Wed, 14 Dec 2022 10:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EzjlbWiuT+IWIg/5Yap5dEXs/ERTMU8woVUGsrNbhC0=;
 b=ZPXAGAfz8BylSpg3nsb4juFTw1S6nqe+dXuo3ZOrLyCCx+Elw4c0DlIjsFGwqzMZra
 pDJAEVkHsy5/S8BqY4dERLkd+BXXu4xJOXpcTp9hPG2z26KyrA9gyIROtj0yNsaAx3a+
 dBlDFIlBmBLFEW2UqlBQVFhYSPe8mZGyW/j1sOgHXJSGAFZ5oHdcSo1hvr3DlirOjZ6x
 8Bc4ib641r9PJkAXnblRIvhBJaKiY9zvz61xD6NcJ4xZpECQSVSUL1eZylnBhKiX2EWO
 1UA6FrVtFzC1vSg9AhglhCWos4VLSQpbBVfLOemH81sBfEPVGZhPLul8D6kLvkAW3scH
 OOcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EzjlbWiuT+IWIg/5Yap5dEXs/ERTMU8woVUGsrNbhC0=;
 b=d1udtTp0JP3oDbv+eNB9onAiOXD4GCyreFDBq5HGve92DHBBJl7l2AO4HFFQT/v2O5
 wNM0RPMjpRP8PLVqARIjAslSTKeIxP3kMbJPzMhGxXKu/U1iZPqWzlnJc16IYBLznlQ4
 jmCdloPf1qFf9k7e7lbxaqom8QIUUrM7Nr6Z2Q4z/K/+DOrjGfg28+zJm+TzQUFDEsK4
 z+fwFLf/76Ev0zmp9QhhXuUuY6bJmKPzaQPizmqhkDIoqzuUVQC7HJHKHzsUyifcjmDS
 sh6ju41S1FmcFJeomGeF5Q2cZn3HrOcA2cJpJigDNT2vymohldZrpfmLN0eoylsLi6r1
 e14w==
X-Gm-Message-State: ANoB5pm0RPQ/mYJsgQ+sX9ap6M1inx3VxRKTUVZQKEDGXnTIQOnCsm6w
 p0vJGULk2G7ZkCvkpst7tWcgFg==
X-Google-Smtp-Source: AA0mqf4h7STmUyPUoDyvAzFw4Emks7KOjE5Q2BcruCIb4Ut83gdOi0blwBN0TgypuFEfN2PlYRfQjQ==
X-Received: by 2002:a05:6512:31d:b0:4b5:5fc1:9d1e with SMTP id
 t29-20020a056512031d00b004b55fc19d1emr6990525lfp.44.1671043331341; 
 Wed, 14 Dec 2022 10:42:11 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 g26-20020a19e05a000000b004b094730074sm897061lfj.267.2022.12.14.10.42.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Dec 2022 10:42:10 -0800 (PST)
Message-ID: <13784faf-20d4-5b4a-efb3-e59edda0a550@linaro.org>
Date: Wed, 14 Dec 2022 20:42:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Vinod Koul <vkoul@kernel.org>
References: <20221213232207.113607-1-marijn.suijten@somainline.org>
 <20221213232207.113607-3-marijn.suijten@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221213232207.113607-3-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [RFC PATCH 2/6] drm/msm/dpu1: Add DSC config for
 sm8150 and sm8250
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
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Haowen Bai <baihaowen@meizu.com>, David Airlie <airlied@gmail.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Loic Poulain <loic.poulain@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, sunliming <sunliming@kylinos.cn>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 14/12/2022 01:22, Marijn Suijten wrote:
> These blocks on CTL V1 support setting a PINGPONG idx to send pixel
> output to.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 23 ++++++++++++++-----
>   1 file changed, 17 insertions(+), 6 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

