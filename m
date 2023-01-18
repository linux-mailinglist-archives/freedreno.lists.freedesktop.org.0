Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CE8671093
	for <lists+freedreno@lfdr.de>; Wed, 18 Jan 2023 03:06:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B295D10E633;
	Wed, 18 Jan 2023 02:06:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6053C10E632
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 02:06:26 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id kt14so20933014ejc.3
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jan 2023 18:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c58v4Ko4NI3Uuss/PDRkANW5YkUAQ7jYBjFl1RBOCWE=;
 b=zI3Kd8HSToOskAIYJ9AMYdGk6gK9HAUtX3cB3qe1xpw8qzqulMdjlmcOl836QQsfzK
 TDsz3LHpGt6jmgbELXDThvifG8xfdgkLYxVtcUjmObM0xAETlJ1iBw/kjBG3FZSotuew
 QFdVXf9gCetL3S/VHhgnWCDxyCJi0WuYquBrokne6kJApWwtM3FiVeD2wslf3XKAJnDs
 U1NK64J8TNee7r9NFXGfZuC9iIUheGnip3wWhTrQsTUPxz/dheaJXAPVE6AojJHv39a1
 yxyQp0ztyn2WjfsU/0Ge+UOLY5qacBIrERfRW7zRXlvGMkco3kjKxcwdZRkzOmQ5IwOo
 0MqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c58v4Ko4NI3Uuss/PDRkANW5YkUAQ7jYBjFl1RBOCWE=;
 b=alwcLaE1lLPvq2+QytV552WoUIe1dPR7zn2v/Jt/cEFXXmY8lF1Zhtmb46Pqc1StxW
 UIMIda03ICOSazaahU1QMrRzR/REyoplNrjkK8rAf0cdqjRsmc5uldsdpU1EPiFKhNPw
 qQs/LlNyN2AKiawMI6NgnIf1iT1axLMCNCIjBneS+Q0qBptdNQOjCGHVQGbWnBORQYmu
 iPLF+T+BvA9sQnczAHp3L7R4mRPY5YYqf8gtuOZzupOtzB/+mK7Ei0S0z4JJUBL09iSs
 CQKpetHxYozsFLdqS/ZLulkiikT7WFeRRr/P3+K6V0mQeBpvXqh/j8CU7ROgTB6lwXek
 I0zQ==
X-Gm-Message-State: AFqh2krPj4alYntBsmx2V3zn+nWJ506In9Ky6C5rEhTkfe3bgbf9qt5x
 hEC2J/DgDAS7iru+AD+TdP/gLQ==
X-Google-Smtp-Source: AMrXdXt1XoRpqpsessMQOJ9ZPWckw/DSv/pfowSn+SixvFGSTvatonHQdf4eFrMQmt8g9fnnGB5+Ow==
X-Received: by 2002:a17:906:6c8b:b0:867:f167:43be with SMTP id
 s11-20020a1709066c8b00b00867f16743bemr4551084ejr.77.1674007584823; 
 Tue, 17 Jan 2023 18:06:24 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 kx1-20020a170907774100b0084d368b1628sm12702694ejc.40.2023.01.17.18.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 18:06:24 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 18 Jan 2023 04:06:07 +0200
Message-Id: <167400670543.1683873.6925891527169997140.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230102154748.951328-1-dmitry.baryshkov@linaro.org>
References: <20230102154748.951328-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH 1/2] drm/msm/dpu: remove dpu_encoder_virt_ops
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Mon, 02 Jan 2023 17:47:47 +0200, Dmitry Baryshkov wrote:
> Struct dpu_encoder_virt_ops is used to provide several callbacks to the
> phys_enc backends. However these ops are static and are not supposed to
> change in the foreseeble future. Drop the indirection and call
> corresponding functions directly.
> 
> 

Applied, thanks!

[1/2] drm/msm/dpu: remove dpu_encoder_virt_ops
      https://gitlab.freedesktop.org/lumag/msm/-/commit/59f0182a291c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
