Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F25E6D22DD
	for <lists+freedreno@lfdr.de>; Fri, 31 Mar 2023 16:46:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AD2D10F26A;
	Fri, 31 Mar 2023 14:46:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1533310F26A
 for <freedreno@lists.freedesktop.org>; Fri, 31 Mar 2023 14:46:13 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id n125so27629360ybg.7
 for <freedreno@lists.freedesktop.org>; Fri, 31 Mar 2023 07:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680273972;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZrHq3nvdZgYqWKc7TXYHf/S8IML0/6fKVdabRYk6kRs=;
 b=FSshoQjBEuyysNCAr4gfKkkGjn4WnfdI+qOqlOkmRGkMNcnt/lTDYQWC74sG1SCNSr
 yA//YZ5ueiDN+mks0OSAOUFD/ujtg6ET1DLreUtSgU2q+etoIHNRF5G933Ped6CgeRI0
 QL92NvVIMFSNYUE9bbc+c64MKwS4aI45gJ4usYlHz/B9dxSZDWGpJNnepadvvprJ3kWU
 SKpZLhDKTfmBr40947S5E077bALebDfpjQNAUSNpdXB1O3cKgF35WnBhuNFcnqVd7wUt
 A6CjUPwCzxd3uRMQakcZWQUV83AYiGZuKUHKAi4faRjl4QKYjuM1EDYKaRJyy4uYt+ir
 Oukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680273972;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZrHq3nvdZgYqWKc7TXYHf/S8IML0/6fKVdabRYk6kRs=;
 b=QRVvrdc4m42M+9V20XsQk+9b5xj8HIt/QaUD10FbVOy+E8VCznlyj3Lo2KJlY5gGYN
 BD3I6isuAYjm8FGEoFRdx7hDxL3fENfpx9tXyektiaZh2lehJ9JFfW0Arcnhzd9J0HHm
 /RyeQrMQYy3lXSL7m5wZP/gEKNqMurCSbWbjofhbseewObaIk9t9r9GE+TenL0aeZU9j
 4oeWmjWifKYJedZ/ovhmyR79TxsP1dCq4bRJV4SFieo//2DjjHzay+HQtliYt86aP9xo
 uiGaRGFSDZOQ8a7b77TmOalysCMGKdYXqKk9vdQU9gfh882gQ3PVvucVeizrOZWD3OS0
 GaFw==
X-Gm-Message-State: AAQBX9dRKjd5NLtbS51OobpZTZZwKIsGi4W1d1E0PU+TVVfzJ4W+TxmR
 Xs+loPhtMRQC2h8mtTOLJeMdZejmPwLnmyk/qY/5Hg==
X-Google-Smtp-Source: AKy350bPOqn4cx7f84281++qJEmUbQ+CCAD8rP4eVc4hTLCXDTlkGh1wbgDJB5qJk6X6yqA4dryEiDQ+tlglpoAIfVU=
X-Received: by 2002:a05:6902:1501:b0:b4c:9333:2a2 with SMTP id
 q1-20020a056902150100b00b4c933302a2mr14740974ybu.9.1680273972110; Fri, 31 Mar
 2023 07:46:12 -0700 (PDT)
MIME-Version: 1.0
References: <1680271114-1534-1-git-send-email-quic_vpolimer@quicinc.com>
 <1680271114-1534-3-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1680271114-1534-3-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 31 Mar 2023 17:46:01 +0300
Message-ID: <CAA8EJprG5g2jzfkez1V0HHO0X_8WDfA9cVfaY3K3cUByW58A1g@mail.gmail.com>
To: Vinod Polimera <quic_vpolimer@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v1 2/3] msm/disp/dpu: allow atomic_check in
 PSR usecase
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
Cc: quic_kalyant@quicinc.com, devicetree@vger.kernel.org,
 quic_sbillaka@quicinc.com, quic_bjorande@quicinc.com,
 quic_abhinavk@quicinc.com, quic_vproddut@quicinc.com,
 linux-arm-msm@vger.kernel.org, quic_khsieh@quicinc.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, robdclark@gmail.com, swboyd@chromium.org,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 31 Mar 2023 at 16:59, Vinod Polimera <quic_vpolimer@quicinc.com> wrote:
>
> Certain flags like dirty_fb will be updated into the plane state
> during crtc atomic_check. Allow those updates during PSR commit.
>
> Reported-by: Bjorn Andersson <andersson@kernel.org>
> Link: https://lore.kernel.org/all/20230326162723.3lo6pnsfdwzsvbhj@ripper/
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
