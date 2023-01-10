Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 711DA66492D
	for <lists+freedreno@lfdr.de>; Tue, 10 Jan 2023 19:19:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3177410E12A;
	Tue, 10 Jan 2023 18:19:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A6310E12A
 for <freedreno@lists.freedesktop.org>; Tue, 10 Jan 2023 18:19:00 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id jo4so30924242ejb.7
 for <freedreno@lists.freedesktop.org>; Tue, 10 Jan 2023 10:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=E971UMGcXwgaAFeIMfskNyBawiDJacixiUkz6okj188=;
 b=n6Y61za4DxKZcQVv04jf0Kgy/LIVUVbd4dG6UI8Zy/mgSnLr8dFB94wEL3D8vJWy07
 3fYwMJAyasn8+fgepgopiyJW5gT0JlyNIYGnbYYZqaf89dLtI/Ckiz+e9CVeijhxne3B
 1CEL/s/UaNtXnjR9P/8nONCzQPlb7gMzuzSB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E971UMGcXwgaAFeIMfskNyBawiDJacixiUkz6okj188=;
 b=b8iJrcuNgS+gQ+3nPShV9dfcKtz+4pObXIGuodJS/k7rmJJQ/kERyDqT4Q4WFGOAZ6
 xu1IV3EfMpCSBOtQNMHNxSFrk/COxSuEuawxcF7VCU2R9qXqG2jRUZvGZCVd7D4n2Caz
 MIeIrFwrZ2curZ2gXFthJmlhgnNJrso9/y2rlt6b+TrPe8W4Ez+IPCazr+wK0RHKTKzY
 LLcETAeQQF6nVEMIi8nlyn6rvpuA7ORvArL/dDA2LKjGWu/UFdV1DE9cooZa+X8ed0+E
 90CbltmgYr9Hdu91goXdNHs3vbVW9/GKt8S/R+qXMIajgFmzzVADXS4wVjWxKQiFBBmi
 jj0Q==
X-Gm-Message-State: AFqh2koDH3olo1L7HubkrGXR2N0xfN+tIr4oiWFOVAf6opKNZY4/QaUV
 iFxfjgHjmmgz/5dX9kxspNmbBhvbyCSTtx8KCcU=
X-Google-Smtp-Source: AMrXdXufwIc22DcB8BuINOZCsfBtaI9Clyk5Yk+hQLpwm+fnGJebZlrsOvS9A9jYK5h6QWFmnW2xrg==
X-Received: by 2002:a17:907:7ea1:b0:7c4:f752:e95c with SMTP id
 qb33-20020a1709077ea100b007c4f752e95cmr76651250ejc.1.1673374739337; 
 Tue, 10 Jan 2023 10:18:59 -0800 (PST)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com.
 [209.85.221.42]) by smtp.gmail.com with ESMTPSA id
 l10-20020a1709060cca00b0082ddfb47d06sm5250307ejh.148.2023.01.10.10.18.59
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 10:18:59 -0800 (PST)
Received: by mail-wr1-f42.google.com with SMTP id co23so12706836wrb.4
 for <freedreno@lists.freedesktop.org>; Tue, 10 Jan 2023 10:18:59 -0800 (PST)
X-Received: by 2002:a5d:6ad0:0:b0:2bc:da90:2ab8 with SMTP id
 u16-20020a5d6ad0000000b002bcda902ab8mr99344wrw.659.1673374407473; Tue, 10 Jan
 2023 10:13:27 -0800 (PST)
MIME-Version: 1.0
References: <20230110025006.10409-1-jiasheng@iscas.ac.cn>
In-Reply-To: <20230110025006.10409-1-jiasheng@iscas.ac.cn>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 10 Jan 2023 10:13:13 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V5DDNtmpLRDGgSx1YVbd8UqTpcYFmvSAxFczn_JY+VmQ@mail.gmail.com>
Message-ID: <CAD=FV=V5DDNtmpLRDGgSx1YVbd8UqTpcYFmvSAxFczn_JY+VmQ@mail.gmail.com>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: Drop the redundant fail label
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
Cc: marex@denx.de, vkoul@kernel.org, sean@poorly.run, vladimir.lypak@gmail.com,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com, daniel@ffwll.ch,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org,
 airlied@gmail.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Mon, Jan 9, 2023 at 6:50 PM Jiasheng Jiang <jiasheng@iscas.ac.cn> wrote:
>
> @@ -1954,9 +1949,8 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
>
>         msm_host->irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
>         if (msm_host->irq < 0) {
> -               ret = msm_host->irq;
>                 dev_err(&pdev->dev, "failed to get irq: %d\n", ret);
> -               return ret;
> +               return msm_host->irq;

The dev_err() is no longer printing the right value of "ret" above.

Other than that this looks reasonable to me. Feel free to add my
Reviewed-by tag once the above bug is fixed.

-Doug
