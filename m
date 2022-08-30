Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 940645A6E9A
	for <lists+freedreno@lfdr.de>; Tue, 30 Aug 2022 22:42:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 858C910E144;
	Tue, 30 Aug 2022 20:42:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42E2610E144
 for <freedreno@lists.freedesktop.org>; Tue, 30 Aug 2022 20:42:26 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id bt10so17168695lfb.1
 for <freedreno@lists.freedesktop.org>; Tue, 30 Aug 2022 13:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=cYIt8T5qTTPMHnPLf3xQ+OALuVf5JTfc65U2LdgUBRw=;
 b=u12h2y5bEzDK0Z7f56rEwzaTFo5dMxORpwCNdjTOvecDv5/T3+4AThU1ci+IcjwQQJ
 Zng+Ii9ZUZglYG8VQN4ZrxV8w7ZtWUy/Yz+KQqHEm/B63vwtNGPaR+AYLFZFbDjLXJNe
 kRkkFAeg8VgZKFONW7AYee4/1rlLY7a7bu7psGDgB/o7yYRC3P/WB36OpOatqYvHdl/U
 E1GCJ2q7/rHqZiQEeaDWR3h/Jw0zmaO3RtEZ8C3taZ/LBRSmqUTYZfrUxD51mrnSgSyp
 YwUQ3lUTUvUGJ2ZXPALH4QAnwbjKoBx0THf0GAgAsbDQVvgX33vVDsdu1cSoJbEblAWR
 u+rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=cYIt8T5qTTPMHnPLf3xQ+OALuVf5JTfc65U2LdgUBRw=;
 b=Tac0amKk2S3UYLHhaIuXOXzdr94srhQfmA4i7LZEBylm/whr3dNkLmQVgV1Z0Rj1Ua
 g43T43BUwYNeyV83tjWb/BG6m6UGMGRImHce2d70aUPVvFqQLs+EVHgzz0koDE/xO+dq
 b01wQVia3ELq2xrS+58awS/98tRW0/z7Wc+LOvwNuLH9uIeYWflhSe+Lnro5z7yNRY9a
 jYuLcnpvnswSeTIVrKZ1bvA4C0rC2XNfXShkcWk/fQBYOgWIy/aGjfSJiF+zAkGqKqYU
 VYDeZP2vdEPGuJ7sllelbOKmpv0IaniLUsar+D945ObC+Uu0VpQdPRH1l6Lrz0sivxWv
 1JaQ==
X-Gm-Message-State: ACgBeo2pbXGqNP1+l997F2s6CS8WZaKTgjbqOevwsVhjbIGqPdJaILXz
 +WnjXkETwi4d8NWd5P3FNUSSMA==
X-Google-Smtp-Source: AA6agR5kINkZTpU9ZCvAgVHkM73uJ9XuvJxMdXlcD3IzA7JJZGJdFWJiTcv47RB/1xYcEd6sZkrb9Q==
X-Received: by 2002:a05:6512:1510:b0:492:df5b:ff76 with SMTP id
 bq16-20020a056512151000b00492df5bff76mr7958543lfb.178.1661892144495; 
 Tue, 30 Aug 2022 13:42:24 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 c25-20020a056512075900b00492dc1bb346sm1712622lfs.260.2022.08.30.13.42.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Aug 2022 13:42:23 -0700 (PDT)
Message-ID: <d43b3936-dbc0-dbca-96de-449cec1fc024@linaro.org>
Date: Tue, 30 Aug 2022 23:42:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Content-Language: en-GB
To: Nathan Chancellor <nathan@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20220829165450.217628-1-nathan@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220829165450.217628-1-nathan@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: Remove use of device_node in
 dsi_host_parse_dt()
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 patches@lists.linux.dev, Tom Rix <trix@redhat.com>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 29/08/2022 19:54, Nathan Chancellor wrote:
> Clang warns:
> 
>    drivers/gpu/drm/msm/dsi/dsi_host.c:1903:14: error: variable 'device_node' is uninitialized when used here [-Werror,-Wuninitialized]
>            of_node_put(device_node);
>                        ^~~~~~~~~~~
>    drivers/gpu/drm/msm/dsi/dsi_host.c:1870:44: note: initialize the variable 'device_node' to silence this warning
>            struct device_node *endpoint, *device_node;
>                                                      ^
>                                                      = NULL
>    1 error generated.
> 
> device_node's assignment was removed but not all of its uses. Remove the
> call to of_node_put() and the variable declaration to clean up the
> warning.
> 
> Fixes: 5f8cdece42ff ("drm/msm/dsi: switch to DRM_PANEL_BRIDGE")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1700
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

