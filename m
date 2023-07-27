Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB70765389
	for <lists+freedreno@lfdr.de>; Thu, 27 Jul 2023 14:22:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2763C10E57C;
	Thu, 27 Jul 2023 12:22:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3B8910E0E6
 for <freedreno@lists.freedesktop.org>; Thu, 27 Jul 2023 12:22:21 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-992e22c09edso113986166b.2
 for <freedreno@lists.freedesktop.org>; Thu, 27 Jul 2023 05:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690460540; x=1691065340;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1SBb6yr6qVk1D7aIwvF+MuMXcq5rUsptu3VpKsdh/uY=;
 b=E/t0YpIRUSdA8qUkKEVwwAbxzJDIw7ZP8JFIlc4qS696AzVGKHZQqeXa5X0v7ynftz
 gWjhCDZ/sxQETJ8KDD0mumZe4SiyyMPQ30LOis/xGakb3U6B5WDQd8yRw9xu73MkEsWA
 vz4knJda8i9mkCBSvKIrANnBbYbWWaaAxjIhLUU5d58Ic+TjSHFelYYLCSlX7YJO+c3M
 nq3lpVGn5sOsQlJ4riCSXqZ2XOmZ7L54K7y5cabw9RIVyZ8BCx2HVtkELtmhASi1FNiP
 7Ty9Nt7wnId/CX0VfxeopkjJChIWLPn5B7UTa+0HQO7nLKyWgzl9aYPVG4xRtdK17s1Z
 Vdpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690460540; x=1691065340;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1SBb6yr6qVk1D7aIwvF+MuMXcq5rUsptu3VpKsdh/uY=;
 b=AFE5Wraxi47tmQbhkzf6rRofcQJGQnsvvAboE1oMT4dDCSAhcCOXb4vzsBzJdw0obY
 5k0GXkgNyNtZ66OmILohrS5bLkTM/R1GYCKRc4K/l0bnIYdulyZm1x4Vt4IPB7Rc2Zxo
 g8fF+ZlqSNrsdin4c4pTHDoyYFeMBzzodA2H5lINHWEN0JmWAjKLSsfh+K6Wdh+5Ip+9
 Lp2HjjOAo7svutkcY6T4DCtkFmR/YCxRuFm+wDRTGe1uFcqSyqY2TxlvuDS6q+BKWxOG
 Z3gy2JLHR9kgi1BgVro0tsIaZ7mXxSs6JLQVAKhA1Yw2YoeiuyStd+Bk9kEW+TkBDwYA
 cqHw==
X-Gm-Message-State: ABy/qLZ7+J0jenT6thCxQoAHqKGsXcDyeZf13rVnWnSZGSlfPKCc0iCY
 JU+kpF227snB6zNgaiIW+pSbwnnDc9yQr91EpDc=
X-Google-Smtp-Source: APBJJlGMdqN9pdEZl9yeo9ApSXHdIn1KgioXc6BrkcQ3JO+iOZr18yfYrhhsELVum+BCBEMCfSnItg==
X-Received: by 2002:a17:907:a057:b0:997:decf:11e7 with SMTP id
 gz23-20020a170907a05700b00997decf11e7mr1850833ejc.12.1690460539893; 
 Thu, 27 Jul 2023 05:22:19 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 v23-20020a1709067d9700b00993860a6d37sm717844ejo.40.2023.07.27.05.22.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 05:22:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 27 Jul 2023 15:22:16 +0300
Message-Id: <169046051039.1413710.6891392677797766408.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712012003.2212-1-quic_abhinavk@quicinc.com>
References: <20230712012003.2212-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v5 0/5] drm/msm/dpu: Re-introduce dpu core
 revision
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
Cc: quic_jesszhan@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Tue, 11 Jul 2023 18:19:58 -0700, Abhinav Kumar wrote:
> With commit dac76a0144d31 ("fetch DPU configuration from match data"),
> dpu core revision was dropped in favor of using the compatible string
> from the device tree to select the dpu catalog being used in the device.
> 
> This approach works well however also necessitates adding catalog
> entries for small register level details as dpu capabilities and/or
> features bloating the catalog unnecessarily. Examples include but
> are not limited to data_compress, interrupt register set, widebus etc.
> 
> [...]

Applied, thanks!

[1/5] drm/msm/dpu: re-introduce dpu core revision to the catalog
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d5ffd30bf168
[2/5] drm/msm/dpu: use dpu core's major version to enable data compress
      https://gitlab.freedesktop.org/lumag/msm/-/commit/51e9b25c7818
[3/5] drm/msm/dpu: rename all hw_intf structs to have dpu_hw prefix
      https://gitlab.freedesktop.org/lumag/msm/-/commit/4c6df9a40bbc
[4/5] drm/msm/dpu: rename enable_compression() to program_intf_cmd_cfg()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/143dfccad3da
[5/5] drm/msm/dpu: drop DPU_INTF_DATA_COMPRESS from dpu catalog
      https://gitlab.freedesktop.org/lumag/msm/-/commit/781452286aeb

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
