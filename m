Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2138B70B5
	for <lists+freedreno@lfdr.de>; Tue, 30 Apr 2024 12:49:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED8210E984;
	Tue, 30 Apr 2024 10:49:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ggVXWQm3";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D37110E984
 for <freedreno@lists.freedesktop.org>; Tue, 30 Apr 2024 10:49:06 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-56e1f3462caso7120773a12.3
 for <freedreno@lists.freedesktop.org>; Tue, 30 Apr 2024 03:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714474145; x=1715078945; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=96pQ6DWgcHMQ5/U8CMRhHuWIuxEmhkD85mjVVrXWF00=;
 b=ggVXWQm3stKy4tP/I2oiT2bSkKLMGlNe0XFTRLRbj2a4iwXzjJmTKlozahno2NTwK0
 4F5BxxJfOojgCD89+msIyGS4w1t/VA39f6sYm5cCWVzF6wfVlv5bbHk967IwQ78+opoo
 UWcRPTZzT0+W0YEJSCIPUAyygD5WOoBgxo6DxJNjYeW1IU9jC77qgTEz1BrsSaV6m6bG
 /kE1FzSL8qXOVQqEOWmUCOfbnZeJk7M0BlCHl+m+4Kr+nNWnPVeeHH5mK9cAvldi4YYr
 z3onUAPBo4nCpSOPt1TDwi7SeFFYaeqZX3mqDYThOdBvhPCBG+EoO7B5N5VSfSC/ynnZ
 lCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714474145; x=1715078945;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=96pQ6DWgcHMQ5/U8CMRhHuWIuxEmhkD85mjVVrXWF00=;
 b=hlA45Sfuk77uzIwp49oa2gpJD9pPAyrMyGF7lCakA2bsaOXqtHumu5mVdg45fF7qxp
 U8D97wXBWNgU61utwgN1u4LY9uCVEc9qiXkm0HxLiRRGHItQqpTN6ITf30Mba4/FCSTh
 hTUiXvp2m52+c9yiuQwEjOjR1Jps5FYtOm7LAyA2xVZrEUs/exv55wcxqJlGGho59OK7
 nNvRsWBFB1zlrOEws9aHY9LrxtBeb960relIzoITs06vxr7N7eo4J4RwPuaU3SQHl7eq
 UzL9db/G+8nYVwwI0AIF+uALgOrqyDXTMdAKGxF8wfkKUsqiEkXvaWsvdSFjEryEeCfz
 y0jA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2QX5nuD/sXY1uJAFwu3fO/+mniPAF6MQAFHCu5q0T8Nw/xuOwgWK2QtWQ5MvC6p6B2FPSMpK6vzvg7sfxr89w0ag5qwBcA1kPgLLJmoqL
X-Gm-Message-State: AOJu0YyAutu1czy+zzgxS+CLs3d2ZocVhqj1Y11z9Og1W3pRUSOgaEyB
 ACOC69SjIiySuGv6jyej7qgFqreo4wD+hz431bRWtEOic/GjL/h7Nj9bFKfKuxM=
X-Google-Smtp-Source: AGHT+IHcHgW7CGWFxNpCJDQuVnBapsMVl/Bvxuzrl9xFVKEJT4JxiWQYtybyj+kN/JkgGXn8LVTdIQ==
X-Received: by 2002:a50:9f66:0:b0:570:5214:f62 with SMTP id
 b93-20020a509f66000000b0057052140f62mr7149035edf.0.1714474142756; 
 Tue, 30 Apr 2024 03:49:02 -0700 (PDT)
Received: from [192.168.114.15] (078088045141.garwolin.vectranet.pl.
 [78.88.45.141]) by smtp.gmail.com with ESMTPSA id
 f11-20020a056402194b00b005728a19c957sm1280572edz.26.2024.04.30.03.48.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Apr 2024 03:49:02 -0700 (PDT)
Message-ID: <26b5a160-f804-4f3b-aaaa-6c4eb6d9d056@linaro.org>
Date: Tue, 30 Apr 2024 12:48:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] firmware: qcom_scm: Add gpu_init_regs call
To: Connor Abbott <cwabbott0@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jun Nie <jun.nie@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 freedreno@lists.freedesktop.org
References: <20240430-a750-raytracing-v3-0-7f57c5ac082d@gmail.com>
 <20240430-a750-raytracing-v3-2-7f57c5ac082d@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240430-a750-raytracing-v3-2-7f57c5ac082d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 30.04.2024 12:43 PM, Connor Abbott wrote:
> This will used by drm/msm to initialize GPU registers that Qualcomm's
> firmware doesn't make writeable to the kernel.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
