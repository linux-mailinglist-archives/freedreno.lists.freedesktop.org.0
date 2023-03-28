Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 750756CCD81
	for <lists+freedreno@lfdr.de>; Wed, 29 Mar 2023 00:38:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A0E610EA1C;
	Tue, 28 Mar 2023 22:38:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25F0510E9FE
 for <freedreno@lists.freedesktop.org>; Tue, 28 Mar 2023 22:38:13 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id s20so14187479ljp.1
 for <freedreno@lists.freedesktop.org>; Tue, 28 Mar 2023 15:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680043092;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yhz6CmqWnomqbGREKgcW3MDgJ3S9r1BJwI9wzCLxIww=;
 b=GhkC8RyxaD7gAVRkE/mUr17glvcMiNhfCk5PwEc9ZiEUKAUL4etNlDPXc+ygWQRIK4
 UOmex8fBErR67SI8j8edBFwcLwqtp/KJps5KhfuWx1SBbnHa2XECP4PvbZEQ/LgzCwMd
 zYIPwqSfJFLSkfFdVcjQMPI5PhRyiqitpATE6H3ZCF6sABVsQRj56ChWleXJa79yjqyP
 L0tuQ8ysJg8sl5cixAWCG9ymzZgsjlC8BQP/8lHJsghQUiZrP6x7aTZfQx+Q3pKoOJt1
 0Jrjy5O1prLtHiRpTH0vR6k0MgMi0WwA0y26pdCyexXKVPVNHPC4R6rq9BuPPVnptcOm
 D3cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680043092;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yhz6CmqWnomqbGREKgcW3MDgJ3S9r1BJwI9wzCLxIww=;
 b=BPNC4VGXUDyn1aB1A1jFkolowwRhjIzdACKTFhR8jOxCJKy7eaA3tbnZdDoQnCtnWe
 qi5CxMJQrsByxl+76rqFI8Djiw3tAK1u6XbMj/vpZGEOEtDwivdlPOi/DsUMNVPAdPIE
 cH2dQW84JGz0jZAE+YogTMqPvXTHpDWjCipEsXrHF5zNliTzOqvNVn9bawPEoS9GvX+s
 fVy2/glLKRp6hJJd9GBveq0/cQXJW/EeqHob0Fw0zW3+cr9XA2GhLb2Jjtj+QubR6okT
 6HgEPdXFd2cSsOakGUbf2JpE6ke7kHdOu5DVfm5s5nSxZzrD0Ie+yQenelTEAkBhX0RF
 zViw==
X-Gm-Message-State: AAQBX9fOL44Yxak5mkktIVWaCGM5Csdy1UDgOa/CRrbE9TlUrRam0YYf
 atM8oOq1Sx246Mr9vDi6x88ZjxL0+UW6Z2SDPZ0=
X-Google-Smtp-Source: AKy350aXisM/hjSHdt9x5liSV084a5gxN2IJLBSsLRBtalk89B5eAjSKjM+kjTpP6J5Md14PmlJ4SA==
X-Received: by 2002:a2e:a3d0:0:b0:2a1:d8e:a2b4 with SMTP id
 w16-20020a2ea3d0000000b002a10d8ea2b4mr5276225lje.17.1680043092480; 
 Tue, 28 Mar 2023 15:38:12 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 t22-20020a2e9d16000000b002934d555783sm5199522lji.6.2023.03.28.15.38.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 15:38:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: freedreno@lists.freedesktop.org, Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Wed, 29 Mar 2023 01:37:58 +0300
Message-Id: <168004255469.1060915.7643490068999732459.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230221184256.1436-1-quic_jesszhan@quicinc.com>
References: <20230221184256.1436-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v4 0/4] Move TE setup to
 prepare_for_kickoff()
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, robdclark@gmail.com,
 seanpaul@chromium.org, marijn.suijten@somainline.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Tue, 21 Feb 2023 10:42:52 -0800, Jessica Zhang wrote:
> Move TE setup to prepare_for_kickoff() and remove empty prepare_commit()
> functions in both MDP4 and DPU drivers.
> 
> Changes in V2:
> - Added changes to remove empty prepare_commit() functions
> 
> Changes in V3:
> - Reordered "drm/msm/dpu: Move TE setup to prepare_for_kickoff()" for
>   clarity
> - Fixed spelling mistakes and wording issues
> - Picked up "Reviewed-by" tags for patches [2/4] and [4/4]
> 
> [...]

Applied, thanks!

[1/4] drm/msm/dpu: Move TE setup to prepare_for_kickoff()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/dd7904e0f824
[2/4] drm/msm: Check for NULL before calling prepare_commit()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/63c3df12d13a
[3/4] drm/msm/dpu: Remove empty prepare_commit() function
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f4d83f101233
[4/4] drm/msm/mdp4: Remove empty prepare_commit() function
      https://gitlab.freedesktop.org/lumag/msm/-/commit/191604898585

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
