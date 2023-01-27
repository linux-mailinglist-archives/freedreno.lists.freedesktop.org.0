Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0CB67E202
	for <lists+freedreno@lfdr.de>; Fri, 27 Jan 2023 11:42:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C7C10E446;
	Fri, 27 Jan 2023 10:42:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF6E510E446
 for <freedreno@lists.freedesktop.org>; Fri, 27 Jan 2023 10:42:18 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id a9so5469871ybb.3
 for <freedreno@lists.freedesktop.org>; Fri, 27 Jan 2023 02:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=u0DEsVHKXVwSN3PAjhc49w5MtI6q8p3tuYvphFNkdg4=;
 b=lu0Vvh5MuoiiYDYZUTxh7zbvym4Uj0/v6GjSmt68vqvdxQUf4Buqig6SOOwUSz/XbL
 lO/9cqb+CuVhsufP2wulTnuiRl2uiG2IjcDc6ivKuvFEojix/qo2+3r/N4B5rLofVMLz
 M+G+sJV93/IYHsoiQEjGskyIqr24h0NhIbgHpj6EDrJRAv53piOFjlOE4jHf6GwByA9i
 BKtw45jsb2Zh+Y12Y2TbiuAYQ63uAaP+ubNy0hNZq3JJEttGX7LxkDCENU+DZqPgecyr
 AqPcysVFgoqtLkToozcLuK7KLQqkNqWwT6Yb+2Eh3jl4zZN177/2r+nainc7iIMJfmMa
 eNSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u0DEsVHKXVwSN3PAjhc49w5MtI6q8p3tuYvphFNkdg4=;
 b=DEcF79Otq/E9QlXCCgGE0+2UwAI//U+9/Mt5TVyvQzJnqtAGxyjFMYkP8DkqtaF5EB
 4WFmA3xc1RY2EIGUR5/7toGwDTDgHxaN3buL4UfIDP8ebyRiZiwbeysTTKwI7knbOcQ7
 7xCgIxrHHvKX7kDEpEWlJA9kUXKBFPsMmX+UI/9nnLyQDe7nVe+bqEMpkPGTiKj57UGp
 7h5Qlc9KRDfzTrCyD709V0Q8g336OwbJx1Za/emu6Ts532fWtH+EZNaSrb4YI6VvvIx/
 0m3flPrR12kv8RzyYbznpCdmy5s3H+zXEaqdvO+r5U46uk/pBLpeARS2ZyoAilOaTIcp
 k8qA==
X-Gm-Message-State: AFqh2kqNc8uiukY6xYYxe/YZXx9HyVMlXV6LCsGmZvg0P3kwO4JrBdMP
 4rB5F+jTCJjaufT+sqk61eB1Dp52v5Ri2xTF7eUDJA==
X-Google-Smtp-Source: AMrXdXt4duFzDFzPIakNzG6OqVc1/XNGxgxhi/nSyzIhtE35B4STzPtFyk5UKGZ1IPXCXqZQlrjy22DL04eJMPVwVFg=
X-Received: by 2002:a25:af92:0:b0:801:525c:6726 with SMTP id
 g18-20020a25af92000000b00801525c6726mr3185391ybh.152.1674816137778; Fri, 27
 Jan 2023 02:42:17 -0800 (PST)
MIME-Version: 1.0
References: <1674814545-9453-1-git-send-email-quic_kalyant@quicinc.com>
 <1674814545-9453-2-git-send-email-quic_kalyant@quicinc.com>
In-Reply-To: <1674814545-9453-2-git-send-email-quic_kalyant@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 27 Jan 2023 12:42:06 +0200
Message-ID: <CAA8EJpruGSXPDd+wj2vZpRQ3wgk3U+Nvvx0hsP=+U503vQ-c6g@mail.gmail.com>
To: Kalyan Thota <quic_kalyant@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 1/3] drm/msm/disp/dpu1: clear dspp
 reservations in rm release
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, marijn.suijten@somainline.org, swboyd@chromium.org,
 freedreno@lists.freedesktop.org, quic_vpolimer@quicinc.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 27 Jan 2023 at 12:15, Kalyan Thota <quic_kalyant@quicinc.com> wrote:
>
> Clear dspp reservations from the global state during
> rm release
>
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>

Fixes: e47616df008b ("drm/msm/dpu: add support for color processing
blocks in dpu driver")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 73b3442..718ea0a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -572,6 +572,8 @@ void dpu_rm_release(struct dpu_global_state *global_state,
>                 ARRAY_SIZE(global_state->ctl_to_enc_id), enc->base.id);
>         _dpu_rm_clear_mapping(global_state->dsc_to_enc_id,
>                 ARRAY_SIZE(global_state->dsc_to_enc_id), enc->base.id);
> +       _dpu_rm_clear_mapping(global_state->dspp_to_enc_id,
> +               ARRAY_SIZE(global_state->dspp_to_enc_id), enc->base.id);
>  }
>
>  int dpu_rm_reserve(
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
