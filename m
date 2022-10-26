Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC2D60DAF3
	for <lists+freedreno@lfdr.de>; Wed, 26 Oct 2022 08:09:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5684E10E440;
	Wed, 26 Oct 2022 06:09:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5966110E40A
 for <freedreno@lists.freedesktop.org>; Wed, 26 Oct 2022 06:08:57 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id be13so26631645lfb.4
 for <freedreno@lists.freedesktop.org>; Tue, 25 Oct 2022 23:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=AQkFYRMFfXcuqnRcd5m+fYI759MoxQcwxUzEDkbo1SE=;
 b=weuKcUHywG8ZesBbFANZ9FB0o9RqWvSCMP2tlTH+iTy81QUj/HHOydfK9fF46TXkVV
 hn0aoQM/4wY04vxz/lHIFwW8KpuP1rJROqiGCoCmlxHUCgJybETGbvNzcdvbbq2kTfBd
 FUwTqq+1dctUt2C/B72NWmH5BBJNErQ4i29z+/Sbn1dokL3edOjfqUuRiySRiQYSfMwS
 ewLEzfs3QpAwPY+THp+zKuWET4/axtn4NnR+16aBdXfrXHu0QlXEgqKETc3e38lCzt7l
 vL2ktf2IbcZbzjQNXA75f3nNvrX8hcm1dDgtZb1vAY+11heBsAfYwhdXvb1ebsRQvR8G
 RpOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AQkFYRMFfXcuqnRcd5m+fYI759MoxQcwxUzEDkbo1SE=;
 b=piaqzCL7LtwuclEkDrNV4NzfG7PJLVbpyRt5ADZ08sjtNS6S9FfdlObslQwprbu6Yq
 6Gn7uXvX5bxJxnhp34ktFYeTiW4q+JfMYwoeMJaJPJBsL5I5XBezkXyC8n+4t56hEHBS
 Q1De/sGY+TvmET5lTJkbN2NwyzioL88e/yu1BlhuSA3g8Jlj4JVuuzZlwUBSP+8fax2S
 PXX+/Ir23qqNMMNGoCi+aAGpjSdjd9LWZF1VzdpDNmGh/2fCzalyXCU0LouDSLda9wkT
 Yu6UTbbOldJSjlcAn8ii2a/6bJGGE+p6wrbnHTXYjYID/CmQTL158tOr9HHM5V++PSol
 WTEw==
X-Gm-Message-State: ACrzQf2lGE0q3iBy0OWKQXv5VcQ2weBy7Gn7qWGOxVlCSjhTQIBaH5XT
 A+uZEY8mmdzVWOm0bRrepTRi+A==
X-Google-Smtp-Source: AMsMyM7aBlusqzl2oZMMOP75nbW9SLTYRVvCS1Z9KkDA0+hM7L4qVTHgav6Vj9SBZUpunCdpnGWYEA==
X-Received: by 2002:a05:6512:108a:b0:4a2:7ec0:2fb7 with SMTP id
 j10-20020a056512108a00b004a27ec02fb7mr17134312lfg.553.1666764535618; 
 Tue, 25 Oct 2022 23:08:55 -0700 (PDT)
Received: from [127.0.0.1] (85-76-42-158-nat.elisa-mobile.fi. [85.76.42.158])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a05651236cb00b0048af3c090f8sm726299lfs.13.2022.10.25.23.08.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Oct 2022 23:08:55 -0700 (PDT)
Date: Wed, 26 Oct 2022 09:08:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>
User-Agent: K-9 Mail for Android
In-Reply-To: <20221026032624.30871-10-quic_bjorande@quicinc.com>
References: <20221026032624.30871-1-quic_bjorande@quicinc.com>
 <20221026032624.30871-10-quic_bjorande@quicinc.com>
Message-ID: <5974CB5A-699F-4768-9DAA-FAE507CFAD53@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH v3 09/12] drm/msm/dp: HPD handling relates
 to next_bridge
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
Cc: freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Daniel Vetter <daniel@ffwll.ch>, devicetree@vger.kernel.org,
 Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Johan Hovold <johan@kernel.org>,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 26 October 2022 06:26:21 EEST, Bjorn Andersson <quic_bjorande@quicinc=
=2Ecom> wrote:
>From: Bjorn Andersson <bjorn=2Eandersson@linaro=2Eorg>
>
>The DisplayPort controller's internal HPD interrupt handling is used for
>cases where the HPD signal is connected to a GPIO which is pinmuxed into
>the DisplayPort controller=2E
>
>Most of the logic for enabling and disabling the HPD-related interrupts
>is conditioned on the presence of an EDP panel, but more generically
>designs that has a downstream drm_bridge (next_bridge) could use this to
>handle the HPD interrupts, instead of the internal mechanism=2E
>
>So replace the current is_edp-based guards with a check for the presence
>of next_bridge=2E

This does not sound correct=2E The next bridge might be a dummy bridge, no=
t supporting the hpd=2E Please change this to use the enable_hpd()/disable_=
hpd() callbacks=2E This way the drm_bridge_connector framework will make su=
re to enable hpd handling for the bridge that is actually supposed to gener=
ate hpd events=2E


>
>Signed-off-by: Bjorn Andersson <bjorn=2Eandersson@linaro=2Eorg>
>Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc=2Ecom>
>---
>
>Changes since v2:
>- None


--=20
With best wishes
Dmitry
