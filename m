Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 323F670DF75
	for <lists+freedreno@lfdr.de>; Tue, 23 May 2023 16:38:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E67F510E44E;
	Tue, 23 May 2023 14:38:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 067C210E44E
 for <freedreno@lists.freedesktop.org>; Tue, 23 May 2023 14:38:01 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4f24d8440c9so6122597e87.1
 for <freedreno@lists.freedesktop.org>; Tue, 23 May 2023 07:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684852680; x=1687444680;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IwjZkiFkTEn5DOob1u6f4e0MEdQ0U22Bgi9iqaPiU5k=;
 b=l2PvtcRvX4FhJkPzgsDqT0EHKkMCGbh8YV27QkEa8Luzk0O/z+MgP17WehB2Sbu1gd
 x/rgJDtB4IIAwkVYTjqDhDtmkNODhL0jinxLcnjcbw/46+debrCgaO6jfQ4okAgHOrm+
 g6vrVjrSlc+hVzPjxIOqy7+x416qNxgyoa0BQlCPOSdPmjYxhn/M1DFqEb3+55/pWPdF
 iH3EKC/52Pj1e/a22AHZCHCLyv9Bvc4jysgEfMU46zfyFaoD2gzTJkQI9aW31a82c1i2
 2z6UuX4u78b1eRoLwm8dM+t8EjmlH2YB5eaMaxy+T2EtqEsJmnm0mkTXpK0Vkj10WD+7
 KjDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684852680; x=1687444680;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IwjZkiFkTEn5DOob1u6f4e0MEdQ0U22Bgi9iqaPiU5k=;
 b=AhXRl0o+7YEd1373jiGSyB6Ryn+Vzr3sgL09r85UogGZmBgAUb4XKVm3OE/js8lLx5
 7Fqxx88j+zMlMBjQC3IU4SPPQ1oLUeM5RhsJVbV6tagLgvJUft7wlyqNoJBx3PWmPcYQ
 /js6ONXICg7S2fkAOlySIymj7L5egR8TAhJO+SvVZlgYGErVINfaoaFBG1cOnSyEKSfs
 NBxVjavZ0mzTOjiqtk6nsdnDrUwow3693A0m4Jp7HnI8G4gn6JaeaaFKuxVNbKPy4BTY
 CtU9aoiVGj1lwWddWAOxzfIOYNYwvnHM6gupacQCjOBw/wrnif8r7cfVzubXeByiujg/
 8g5w==
X-Gm-Message-State: AC+VfDxRQW81k8a8OCiOjYFfeU0K2l4ejIqC2VoOTwFnoDHxqsp31hdJ
 9o3xU72Lbv19cU6Ps+PdXiGm2xZKPoc510jkov0=
X-Google-Smtp-Source: ACHHUZ6HITmbgqDyWlT7VL9iOz3qZJaH8Q9aP1+/zTO2oaOKx226/0Er4FBLGDErldVzU86GByx50A==
X-Received: by 2002:ac2:530c:0:b0:4f3:b18a:6494 with SMTP id
 c12-20020ac2530c000000b004f3b18a6494mr4420275lfh.22.1684852680072; 
 Tue, 23 May 2023 07:38:00 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 w17-20020ac25991000000b004f3a4ccedebsm1378723lfn.87.2023.05.23.07.37.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 May 2023 07:37:59 -0700 (PDT)
Message-ID: <65703341-45e6-0ff6-c1bb-6966c3e40e40@linaro.org>
Date: Tue, 23 May 2023 17:37:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-GB
To: Dan Carpenter <dan.carpenter@linaro.org>
References: <b8bcb789-55c4-4169-be3f-4153d14c0ef9@kili.mountain>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <b8bcb789-55c4-4169-be3f-4153d14c0ef9@kili.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [bug report] drm/msm/dpu: add HDMI output support
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
Cc: freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi Dan,

On 23/05/2023 10:36, Dan Carpenter wrote:
> Hello Dmitry Baryshkov,
> 
> The patch ea767bb1752f: "drm/msm/dpu: add HDMI output support" from
> Apr 15, 2023, leads to the following Smatch static checker warning:
> 
> 	drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c:647 _dpu_kms_initialize_hdmi()
> 	error: uninitialized symbol 'i'.

Thanks for the report. It should be fixed in today's linux-next tree.

-- 
With best wishes
Dmitry

