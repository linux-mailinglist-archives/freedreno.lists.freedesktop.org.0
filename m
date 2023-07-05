Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6FA748ED4
	for <lists+freedreno@lfdr.de>; Wed,  5 Jul 2023 22:23:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7045310E3BF;
	Wed,  5 Jul 2023 20:23:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D81810E3BF
 for <freedreno@lists.freedesktop.org>; Wed,  5 Jul 2023 20:23:25 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4fb73ba3b5dso11575004e87.1
 for <freedreno@lists.freedesktop.org>; Wed, 05 Jul 2023 13:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688588603; x=1691180603;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=i4Krz0jpGa+XsfRzmlooU2kh6gKmBpKJ+WGmeH2oOqg=;
 b=OCJKPDAEF6uYuFYTTRjmoDcNVfCOc3C65oJTLebbJjGX9zDQd1S9oLEPA/8I/1w44l
 s7aj7glDs6V8m4aLWBr/R7dQljgI8io7/sz9JVKfynw50NweupSgSF8R9wd4JFA4zUJk
 tTx/Sl93Ao8jqXb/uxZADO5jjMNn1W6HFvnd+LmYyXkSkWVCYgn+D0m/pamm0D5jp4gz
 tqLFL7F+dPwI/VpZrhPaw/ZdXyMGvlhwJR9svNBUdQIikKCQvmUA6ZsBl+9oMSugjcoI
 4cjMXDq8JltvDbRjyiCAFmC5J98GEZP30Iy1xaME6hP3UhenxrnrPRX9rBPmA/wNYeI1
 b98w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688588603; x=1691180603;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i4Krz0jpGa+XsfRzmlooU2kh6gKmBpKJ+WGmeH2oOqg=;
 b=B/MlxRQVzkcUze8MwTUFh//w5wYAmqTytxulzX0eNmDeT9uTHVOi+SGYDGI8yD9jtk
 g68bINZkQVB2aiHWRWA7w5gCHIuCqcgP6wUslO/t/8OeAJ8h4DWNnzNHs+adhDUNFyaa
 +Cbwqx79oLtZ30fcq4JwjcNxzXC5dIBEcjDbIWnfyj/pFoj9A6mFjr+jkrIqR/0kHcXQ
 ZrLXEUZvQhGnRUAtxKmEzAAR+cB8wFdUOpw0YqVunKA3RbynTDMIBfnv0qYMfhaw7oX2
 KTI6RWVbOZpWd20dtnJ71qn9dtaY9vdOMZNVLKbwABQo9hCCId9kBPGEzB1IRY51/lcq
 TlRA==
X-Gm-Message-State: ABy/qLaJQ39EueoxI7swR/wUM+jhaICG18vUAOqm71+k1tiuuRSyj20Y
 TxmBBcWROBa2kJtuoVD4QgOlYQ==
X-Google-Smtp-Source: APBJJlErhbnzb11CngKsxh5v1reVcDJ9y5He3cf6Hfu/CY4cRjQ5+lMWFHIQ3pvGXPpkL8mDGwPEDA==
X-Received: by 2002:a05:6512:3d28:b0:4fb:8802:9554 with SMTP id
 d40-20020a0565123d2800b004fb88029554mr95575lfv.6.1688588603673; 
 Wed, 05 Jul 2023 13:23:23 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 z14-20020a19f70e000000b004fa35167729sm5492187lfe.159.2023.07.05.13.23.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jul 2023 13:23:23 -0700 (PDT)
Message-ID: <878861f0-f862-f19d-970a-825f660ba281@linaro.org>
Date: Wed, 5 Jul 2023 23:23:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Ryan McCann <quic_rmccann@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230622-devcoredump_patch-v2-0-9e90a87d393f@quicinc.com>
 <20230622-devcoredump_patch-v2-3-9e90a87d393f@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230622-devcoredump_patch-v2-3-9e90a87d393f@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 3/5] drm/msm/dpu: Define names for
 unnamed sblks
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_jesszhan@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 05/07/2023 22:30, Ryan McCann wrote:
> Some sub-blocks in the hw catalog have not been given a name, so when the
> registers from that block are dumped, there is no name to reference.
> Define names for relevant sub-blocks to fix this.
> 
> Signed-off-by: Ryan McCann <quic_rmccann@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)

I'm not happy with this approach, but let's see how it goes.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

