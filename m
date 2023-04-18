Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E796E5D73
	for <lists+freedreno@lfdr.de>; Tue, 18 Apr 2023 11:33:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E3110E71A;
	Tue, 18 Apr 2023 09:33:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35CD110E729
 for <freedreno@lists.freedesktop.org>; Tue, 18 Apr 2023 09:33:43 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2a8bcfbf276so15991291fa.3
 for <freedreno@lists.freedesktop.org>; Tue, 18 Apr 2023 02:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681810421; x=1684402421;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=L5WXOPB3Y4MTTwsxf9PWuOZ+BaBJ0YphlGsakZvJs+w=;
 b=piROnxjik+2/8Dv62cOus3n34UMiSOvIvZIPF9eI7/ArQzcwp1nxufhHkwzt+FRGI2
 IPzl1e5Gb4zQMqV0EAGwCWRirvfvzG3+pk29rhByc6tDVmi85gF1LPsglMQNF2ELFvp2
 3+xeWPl5d44dyiCVqBafSn8m0Z5NT9YZyhx+XYARcd27up8nO0VU1Fnq+cwjutZwF042
 yCyd9WJtVEM4sBHZvNIIiPuthDLI5jBjC9LSrrMSh0ll/q3jA04OzjXUs8puGbEboSQ4
 Tu4c1VbEjk5j2xtTavHalPvjWr9pQGn0XQ2hIhYwVWQN/UpQfIJjux/G7HI3F73/2jQu
 kTRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681810421; x=1684402421;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L5WXOPB3Y4MTTwsxf9PWuOZ+BaBJ0YphlGsakZvJs+w=;
 b=aUxLV+PmJDLrVjoNFhScjC6lIqfoo7m8T7MzFP67cSO2nVgiW6T4kqM10v5aeJnT9p
 XLQvQ+uTrb04zN59t7NI3UPB+Q0bYYOEDrL7RNruMLRsEXLbOnyZLqz7oRsMSGosMNHp
 KH/+YbwZDAJ9OO3m7NWo8NED7EYr/bkKBVTmmflnPjjCnzrDeLvx1kI9PW/3+GQD96Vw
 iC6EM99975xjmvi/03K8x062R6unTiuk1aI0HscKITmOg5sU9RzPU4tXFdjAJFCv87IC
 EOC0Rjzz+sXBhqgZ6itMQiiFzQedS6RqYjLAdui/jsTuaWLL87rF2ZHO0mOf8g2fVt9N
 jIAw==
X-Gm-Message-State: AAQBX9clvm+UZcUPkoJONoC/8GWQKQfg7ZtUkUxsvy0VGJgIJz3JyOvw
 SFOBqKVeO20fqyLxXYtd+fVeew==
X-Google-Smtp-Source: AKy350YfDnqx0ekmnOPKbiqhXQUmmKOiIzrPgd/oF+uGgWd9KFMGoFe5h5owEJ0XYWkDm/hdL7V4iw==
X-Received: by 2002:ac2:51b3:0:b0:4ec:a18e:f985 with SMTP id
 f19-20020ac251b3000000b004eca18ef985mr2854150lfk.13.1681810420962; 
 Tue, 18 Apr 2023 02:33:40 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
 by smtp.gmail.com with ESMTPSA id
 f15-20020ac251af000000b004dc4becfcd6sm2319201lfk.54.2023.04.18.02.33.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 02:33:40 -0700 (PDT)
Message-ID: <a0518750-367d-5ec9-f49f-77e90d51cbf5@linaro.org>
Date: Tue, 18 Apr 2023 11:33:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230417201215.448099-1-robdclark@gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230417201215.448099-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [RFC 0/3] drm: Add comm/cmdline fdinfo fields
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 Chia-I Wu <olvaffe@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Looks like the 'PATCH' part of your subject was cut off!

Konrad

On 17.04.2023 22:12, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> When many of the things using the GPU are processes in a VM guest, the
> actual client process is just a proxy.  The msm driver has a way to let
> the proxy tell the kernel the actual VM client process's executable name
> and command-line, which has until now been used simply for GPU crash
> devcore dumps.  Lets also expose this via fdinfo so that tools can
> expose who the actual user of the GPU is.
> 
> Rob Clark (3):
>   drm/doc: Relax fdinfo string constraints
>   drm/msm: Rework get_comm_cmdline() helper
>   drm/msm: Add comm/cmdline fields
> 
>  Documentation/gpu/drm-usage-stats.rst   | 37 +++++++++++++++----------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  4 +--
>  drivers/gpu/drm/msm/msm_drv.c           |  2 ++
>  drivers/gpu/drm/msm/msm_gpu.c           | 27 +++++++++++++-----
>  drivers/gpu/drm/msm/msm_gpu.h           | 12 ++++++--
>  drivers/gpu/drm/msm/msm_submitqueue.c   |  1 +
>  6 files changed, 58 insertions(+), 25 deletions(-)
> 
