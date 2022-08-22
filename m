Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9899D59C4D9
	for <lists+freedreno@lfdr.de>; Mon, 22 Aug 2022 19:16:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F56C94169;
	Mon, 22 Aug 2022 17:16:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B69B18A473
 for <freedreno@lists.freedesktop.org>; Mon, 22 Aug 2022 17:15:57 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id by6so11225153ljb.11
 for <freedreno@lists.freedesktop.org>; Mon, 22 Aug 2022 10:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=3B91h+yrTjwS7I4FUx77uKxPNz+E7GshMHnIapiZTc8=;
 b=L9QS1hKwgWBMx6ma10ELOh9eQnoZAT8Szdd1iSgK+rhGHKoZ6Mtm7TdVEyday19ApG
 R3x87oAm5OhNvqgvSNUuuRIalt/FEzvZraWsVRATJVhrk2zNUxrDG1DaPfqa1gnvRiET
 GrjSk+xWXT3q1YI3kCSOaTd1UTyO1DACmUkCAqSUglcPKmJP1VWpzOVBZaafRTN020KX
 qgfAE13dDMgRhUjuX7bsxL0AleLwvYnfTTynsdyZJ0GrQ26JoQvufwKvqsGlC2wbb9YA
 nfXmXt03p+fYISvL3GLe/omMfhMvZoA6T2eo0unJ3CCi/WCwLifw7v7K7vddOmcEa/u+
 O91Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=3B91h+yrTjwS7I4FUx77uKxPNz+E7GshMHnIapiZTc8=;
 b=QuTzex4TotbRvz31HHX02vlLHm1KN4GKBI4YAzHV4LkbsIUr5Kl/MHmZKv33V0D5L4
 zbewebDPsh/t7NpM9TuTqUZJSnRkHk5EpdiJbicIq4p8Vmaat3dGKHrvwAnBIfuWKWUD
 aGzHCslPx/bI53i92d/TEafuiEKPGNgJzWMR5le2b8m6Xb1w5FlI89TGSiJNu7PAImQX
 QjoDzXfRbp0lAjqr7RP+zEge9r/+X7FEJ2Rdr8GIm4yaURwpRHybZ3Aoeg4SNuShT36r
 yfMo3pdxeXWN7DzWf2IEX+ybOnNw7akYl7rvkAaZEVYnWOT33pQjVDfuBuhUK8b7O/+x
 0kuw==
X-Gm-Message-State: ACgBeo3yZJAJT2XOvDwURB2dLymUvySYJv04B4Cnu3fppl2EDt0bnfyQ
 UAym41FQykRLLLV2XS5e230+8Q==
X-Google-Smtp-Source: AA6agR45NEMpbO0Z9AzrrsVon/LA0ZrvVtjVxutO5v+1o6P1YNcB95+XrUkQ2XHqrbFf16qxDUfE0w==
X-Received: by 2002:a2e:3314:0:b0:261:d144:faa4 with SMTP id
 d20-20020a2e3314000000b00261d144faa4mr1232145ljc.208.1661188555755; 
 Mon, 22 Aug 2022 10:15:55 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 w9-20020a05651203c900b0048b0bf9f4bfsm2010195lfp.140.2022.08.22.10.15.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Aug 2022 10:15:55 -0700 (PDT)
Message-ID: <f0016468-16f9-aca1-c362-805bfd141e57@linaro.org>
Date: Mon, 22 Aug 2022 20:15:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220821155441.1092134-1-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220821155441.1092134-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm: De-open-code some CP_EVENT_WRITE
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>, Chia-I Wu <olvaffe@gmail.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 21/08/2022 18:54, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

