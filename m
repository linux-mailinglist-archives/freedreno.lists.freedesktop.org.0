Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDDE6E86C4
	for <lists+freedreno@lfdr.de>; Thu, 20 Apr 2023 02:46:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1781A10E1F3;
	Thu, 20 Apr 2023 00:46:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1BFD10E6FD
 for <freedreno@lists.freedesktop.org>; Thu, 20 Apr 2023 00:46:32 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4eed764a10cso235179e87.0
 for <freedreno@lists.freedesktop.org>; Wed, 19 Apr 2023 17:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681951587; x=1684543587;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hAwtjTm66ceJkf1KKSI3nNqDV9Qs3Z4h0lY2QCF3PFM=;
 b=pmi4EpcafzRZMbKbZksxYUwEaHhqtJlHu6hKBQwqudAokUDzk86sDhfq+W+wVCJ15p
 FQA+scFNJnltisIQoPk6HMIG1qfvvv58ZtPzcDID7dE2BhiKhZV4cDUe/U0bLk6cRQ4j
 mzPvA4yRfoOXgVb7+eakd2la4gbec+rf6ogQjMWlC3R1Zd4Xivw4xf/UnkigxxcTkkzX
 Qh34MtYL3b+K0hO/njU713fFyZPcRQ6u9s9tR+K8I61tXUsXXqsMmeYysVWH+h/UwYMK
 I4LuTuKBm7ajrdseBEDjDirHg0CijeHlSMoiu5LtYcIxa9tXRb4mHOSkvT5Vou50FM6Y
 DfPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681951587; x=1684543587;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hAwtjTm66ceJkf1KKSI3nNqDV9Qs3Z4h0lY2QCF3PFM=;
 b=YciYzf1uUllIem2sSSBKyqHY5gsBsOsgi71l9s/QdSV/3Z7MJV0I1FJdub1foYwPPY
 txmfEKnNy3uzsbyw5EZB0wd1HyDSpyPphj2iyMda3wJiD0JZUmoHOrv+9c51Ao6h6YIx
 UBLle5jMwse30g0md3oxHmtpcpkJoajoNinBbxd+Y+k0zrPOlWF4BQDH5O6dFF6AAX21
 m1Ej1KqUwOKODyyt4b0OCRcg1NARq4V9WyGEl54F89MpWe9/w1A8Kx+crcu/xcd7YyQL
 IFqzyZASeo082DhjwdlLNOqNAa3sYXVz/ZBlBgKTiX5hQPjN4jeCvvLWoJDBrNSJt244
 23Pw==
X-Gm-Message-State: AAQBX9cFl/tyfZlJTcDJBgq29VswSZjS+xW9MThBRMrCyBrnbrYuNwmq
 vbPZ4Q/f2yUTUxRgGZVmtU+dWQ==
X-Google-Smtp-Source: AKy350YouuosrbAj0lA+ydm3t/J2LQTkm5ebLkRGVt4fbyvc013IwsDwJYJOnRNU8NL94/Kc4sO4zA==
X-Received: by 2002:ac2:488f:0:b0:4e8:5e39:6238 with SMTP id
 x15-20020ac2488f000000b004e85e396238mr3598983lfc.42.1681951587446; 
 Wed, 19 Apr 2023 17:46:27 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 c21-20020a2e9495000000b002a8ac166e55sm16796ljh.44.2023.04.19.17.46.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 17:46:27 -0700 (PDT)
Message-ID: <5dbeefb3-6de9-0a9b-4404-53eb236c0db2@linaro.org>
Date: Thu, 20 Apr 2023 03:46:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Adam Skladowski <a39.skl@gmail.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Robert Foss <rfoss@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Rajesh Yadav <ryadav@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>
References: <20230411-dpu-intf-te-v2-0-ef76c877eb97@somainline.org>
 <20230411-dpu-intf-te-v2-5-ef76c877eb97@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230411-dpu-intf-te-v2-5-ef76c877eb97@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 05/17] drm/msm/dpu: Remove duplicate
 register defines from INTF
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
Cc: Archit Taneja <architt@codeaurora.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 freedreno@lists.freedesktop.org,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 17/04/2023 23:21, Marijn Suijten wrote:
> The INTF_FRAME_LINE_COUNT_EN, INTF_FRAME_COUNT and INTF_LINE_COUNT
> registers are already defined higher up, in the right place when sorted
> numerically.
> 
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 5 -----
>   1 file changed, 5 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

