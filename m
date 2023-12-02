Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2181C801EEA
	for <lists+freedreno@lfdr.de>; Sat,  2 Dec 2023 23:08:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD75810E0DA;
	Sat,  2 Dec 2023 22:08:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E8C10E151
 for <freedreno@lists.freedesktop.org>; Sat,  2 Dec 2023 22:08:51 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2c9e9c2989dso14593061fa.0
 for <freedreno@lists.freedesktop.org>; Sat, 02 Dec 2023 14:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701554929; x=1702159729; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gBnQbPIaKZ1FnI4i+KfUpDsqKQ/SRB/Q4CkBHEZWQ+s=;
 b=tUc0e7S4eTumPmqc3g98HiySQk4eHCi3x44ZDCEsWgB7IIUtvhCBcPf2dbbwCQFVrA
 dJovz7VH5Vc+w3yntNRkoVlaaFSoAwtHd1qSeoRWKcEpBBaWCMxY4NAR7s7ndb1X+awl
 hhjuKt5vM2ZDJTISOReACtpqDmXhS/oH1Wjw+BShnv8CRJCFsBW+0aYluo67+KvzR9pt
 yYJFH/ql0c7OaY0SWcApaO0J3fxvsrgVo8f9tVTfH67sML3dVk2q7aAsczLqMsEbNYNT
 vylbbCFZ4hDWy8LQquitGSXxjEseDr3ixvKAqRvCBfXiGbCo264oozBrAZsjCvT1jJSP
 saJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701554929; x=1702159729;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gBnQbPIaKZ1FnI4i+KfUpDsqKQ/SRB/Q4CkBHEZWQ+s=;
 b=gE2X7t50V+UkL/LG99IOP1wXR4SfqEfAbqrXEtzAlK7v3oCXtn2B443Rvo3Y0Qw3ci
 SwPK6ONAAHeqhuNWfH7TG77JrfYRbIxKHszucpz4mzA1LMYnLhs1rdeP9N4oLPtfPbUy
 14UXw6DRSMD6P6H7oKXLDEwEwL1s0RAiGOS7zks84FYbxjBa3CbaTijwGSroVmUbE8SP
 8KIAvDdQVjcmye6moTm3bQM7OfXB3EnkshAgfXIQwtrIvuoka6NLaGxoaKumAjGXRk/p
 jMoaP4KeJ3nFVCQqrIBx8s16d6MsxIV9Kw2IDVHOn5SYW9fTmUNXfUKkF3pBR+ovZVtb
 Xp4Q==
X-Gm-Message-State: AOJu0YyOGKs4ueS+cdFp7nA76HTXZVwegEUf4iq6A8/84iK9ooghYmPR
 0pKQMJMpQ1VE9vK5+6KEnjs/Bg==
X-Google-Smtp-Source: AGHT+IHtNMy5Yq1qJwCjIbPETZ9dRA+AvYabXqW3vd5GCgYQ+Z9Fd/TLncg8J3C2Wr4ROOmIVxmsBA==
X-Received: by 2002:a2e:b0ca:0:b0:2c9:f57f:fcf6 with SMTP id
 g10-20020a2eb0ca000000b002c9f57ffcf6mr410723ljl.37.1701554929583; 
 Sat, 02 Dec 2023 14:08:49 -0800 (PST)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 p21-20020a2eba15000000b002c9eca858a0sm344305lja.137.2023.12.02.14.08.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Dec 2023 14:08:49 -0800 (PST)
Message-ID: <124cf6d1-16b8-45e1-997c-24f176f59e20@linaro.org>
Date: Sun, 3 Dec 2023 00:08:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Kunwu Chan <chentao@kylinos.cn>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, marijn.suijten@somainline.org,
 airlied@gmail.com, daniel@ffwll.ch, jordan@cosmicpenguin.net,
 konrad.dybcio@linaro.org
References: <20231123033329.27477-1-chentao@kylinos.cn>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20231123033329.27477-1-chentao@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm/gpu: Fix null-pointer dereference
 in zap_shader_load_mdt
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kunwu.chan@hotmail.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 23/11/2023 05:33, Kunwu Chan wrote:
> kasprintf() returns a pointer to dynamically allocated memory
> which can be NULL upon failure. Ensure the allocation was successful
> by checking the pointer validity.
> 
> Fixes: a9e2559c931d ("drm/msm/gpu: Move zap shader loading to adreno")
> Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
> ---
>   drivers/gpu/drm/msm/adreno/adreno_gpu.c | 4 ++++
>   1 file changed, 4 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

