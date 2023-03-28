Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 472376CBFB9
	for <lists+freedreno@lfdr.de>; Tue, 28 Mar 2023 14:50:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D003910E8A1;
	Tue, 28 Mar 2023 12:50:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DAC910E89D
 for <freedreno@lists.freedesktop.org>; Tue, 28 Mar 2023 12:50:07 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id x17so15683024lfu.5
 for <freedreno@lists.freedesktop.org>; Tue, 28 Mar 2023 05:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680007805;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5aKpkNh/8xXK99VFZwk3PtzVkWaagAJQbPThES4qo4c=;
 b=aDlmW+3M03gsIwxLOi7jI/MjPJRefPCoqxUEHPPvw+Bj6hdtAn6oDZjDN4Rv9QfIuC
 HrMnmJmHdBVQ3USLkYxXH0RuoKAG9ewagvA2THN+WbuR/5mX/jEU+tcn0olCh5S4uT50
 tmNyYhRqrGSNSo5hStO/WvtMuLcLgPDRaeha5V1cFolm5PPvScWNyGjswToTRzW/cyA3
 cbQQDUdQC8CBNzoexTWDqhVv+Rpi7y/kbhgoPRKUzvdYxEtd2ct2NyyAorAbKIRLvl40
 jFYNJpdKqfUaItIyX42pH0+BZnvGOrjgENJIPCZDYlJ3XdZliIE5tT/2tAeBav/H9C6E
 f6jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680007805;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5aKpkNh/8xXK99VFZwk3PtzVkWaagAJQbPThES4qo4c=;
 b=7D5NJQwHA7niS3d8eedbNGTuQjCPQf5ZXIBp8r11anZaZwyA6RdGL3RuBj/emyoFW1
 5w6OI6T6U3XRK4H9Y4Lpe7NE+Jiy/hrV2W3NPKxAWMztVbSS8HEgmU+RtUNlnE+gEUhu
 LqqeZx7MzzsytfCM4MCj5s99tiqsK7tE/Z/X05us+fv0lUARdOjCAGa8RY5ORaHuMpcp
 ISBC0ZC9RKs/PLZEd+ehMyhMg72cIT4N79vfoOXdoxt9oT0G0l8K40Tc8e94CtVznEa0
 Agzp59U5ItiA3GeQ1CQ1G0nyoYJ9DLbg5zj6RG3yHg1D+Vfno3gtylH/Aya2N3wBF1B5
 QveA==
X-Gm-Message-State: AAQBX9fSJsoOoOjVU0kx9KJJeSs2jh38Dtd3PrLeaLYcT+eVaCBViKtO
 Ccbw94evAp3edd0Z9mMMYG1I8w==
X-Google-Smtp-Source: AKy350YB19ZNZUdZmlZrfVEq4gizIOk+KuH+83cH+JiVYmIQT1UXUtff0FtR/clzr94IT76z/SEGBQ==
X-Received: by 2002:ac2:531b:0:b0:4e1:8309:1db5 with SMTP id
 c27-20020ac2531b000000b004e183091db5mr4650842lfh.2.1680007805502; 
 Tue, 28 Mar 2023 05:50:05 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 e18-20020a056512091200b004cb08757441sm5031213lft.199.2023.03.28.05.50.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 05:50:05 -0700 (PDT)
Message-ID: <f1a7f057-0b96-473d-d5fd-5fc2d1352642@linaro.org>
Date: Tue, 28 Mar 2023 15:50:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Johan Hovold <johan+linaro@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230306100722.28485-1-johan+linaro@kernel.org>
 <20230306100722.28485-8-johan+linaro@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230306100722.28485-8-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 07/10] drm/msm: fix missing wq allocation
 error handling
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
Cc: Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 06/03/2023 12:07, Johan Hovold wrote:
> Add the missing sanity check to handle workqueue allocation failures.
> 
> Fixes: c8afe684c95c ("drm/msm: basic KMS driver for snapdragon")
> Cc: stable@vger.kernel.org      # 3.12
> Cc: Rob Clark <robdclark@gmail.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/gpu/drm/msm/msm_drv.c | 4 ++++
>   1 file changed, 4 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

