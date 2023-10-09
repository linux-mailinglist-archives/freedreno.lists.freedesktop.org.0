Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B10F67BE747
	for <lists+freedreno@lfdr.de>; Mon,  9 Oct 2023 19:02:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 636AF10E18F;
	Mon,  9 Oct 2023 17:02:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBDD810E18F
 for <freedreno@lists.freedesktop.org>; Mon,  9 Oct 2023 17:02:42 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-503397ee920so5951624e87.1
 for <freedreno@lists.freedesktop.org>; Mon, 09 Oct 2023 10:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696870961; x=1697475761; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uRuutAZs8fFclbHqtZl6SoFD2RTZgdCG/+ruCdezTQs=;
 b=L3bI6TEvqhbcC21KmSxJFe/3ZAyt3QJcDpuTigyuVKEEBm0kob2Jp+7IlzohEk9ldg
 DzkBln5+c8aGQzurTHyJnylntgUhdiONXuDvpvuo4WiVTGbKbGRhprGtjUVFYPgVcvHb
 +61C1pN1tiZJfCiOvoz8+W1ERT9EXElu5YcAsWnZ0bqHi7XafqTrQ8tQrxWqtw2FY7+h
 6PqCiFi2liFJREHipzu8VSPqtObMXeJTfAUkFCMkIg/uwHiWBJlXXQijEehSm3qw8z+e
 9ZYv/InBXI44oNaG+gQZ+cWMLFtHAyvypE9u4MY9j/wv01hiWShkzZ27o56iHt/It9RM
 zFug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696870961; x=1697475761;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uRuutAZs8fFclbHqtZl6SoFD2RTZgdCG/+ruCdezTQs=;
 b=Wu3vPHn0LBIGWFYW25+GbQ3Q2o5SCGt3gkkjHm8FSZd6VpE36ECYdbQeDLSYP1GDon
 sZTCXsI97NXll1rHtDaWt9of4t/FyDXyCn7Fza3+6C1e69QcYdD1w6XMi1f0FxfVDQX3
 4/bKfJV1dA3mXg92JzzZ61MOb+ToZH5nCzrjgDM13viiwNeF/bKhz5BLvSsus1rMGfwl
 N42MZp1LzVaaxfp2/prCn47mvim7k7fW03ix/xmqexIYOmT5PyDtRUzTm7ho/rEMiLyj
 uHEBD2UcVcLvQkZ0RCDxfpMmuAaABNXEwaVXpnbTzr08BS1y8rVovg2JlQSBt7jfD9Ix
 19hg==
X-Gm-Message-State: AOJu0Yxbnk3Usi5A7Mmw7wcCrJIuuA+si+yrlNcPOyorGYimApY30TB1
 CcMVGTbjWdmK2blXgzOrZEqxSQ==
X-Google-Smtp-Source: AGHT+IG3N9oYTVVpWHCHcenUkG2u+mwOdltu7goVxMyVQmfsCsfNgPExviIbIkYFLeq5xxpYKPwL3Q==
X-Received: by 2002:ac2:5b1b:0:b0:503:60e:91f5 with SMTP id
 v27-20020ac25b1b000000b00503060e91f5mr14425167lfn.36.1696870961038; 
 Mon, 09 Oct 2023 10:02:41 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 r2-20020ac252a2000000b004f1400630d3sm1492618lfm.35.2023.10.09.10.02.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Oct 2023 10:02:40 -0700 (PDT)
Message-ID: <b0776261-323b-4f3f-a1d7-9a6b59f39276@linaro.org>
Date: Mon, 9 Oct 2023 20:02:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20231009-topic-sm8550-graphics-sspp-split-clk-v1-0-806c0dee4e43@linaro.org>
 <20231009-topic-sm8550-graphics-sspp-split-clk-v1-3-806c0dee4e43@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20231009-topic-sm8550-graphics-sspp-split-clk-v1-3-806c0dee4e43@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH RFC 3/5] drm/msm: dpu1: vbif: add
 dpu_vbif_setup_clk_force_ctrl() helper
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 09/10/2023 19:36, Neil Armstrong wrote:
> Move the actual call to the MDP setup_clk_force_ctrl() op to
> an helper which will call the correct op depending on the caps.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c | 15 +++++++++++----
>   1 file changed, 11 insertions(+), 4 deletions(-)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

