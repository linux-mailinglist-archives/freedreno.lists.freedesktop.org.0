Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F06DA6CCD71
	for <lists+freedreno@lfdr.de>; Wed, 29 Mar 2023 00:38:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 900E910E9EB;
	Tue, 28 Mar 2023 22:38:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 634F810E9F5
 for <freedreno@lists.freedesktop.org>; Tue, 28 Mar 2023 22:38:10 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id y35so11665894ljq.4
 for <freedreno@lists.freedesktop.org>; Tue, 28 Mar 2023 15:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680043088;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BOwWonrpE9Dkyy4Q/0LXCbY8zJnCltM/M3j75FmH7fw=;
 b=a7ZnX691SuT2RJykm2XbV+BlyKWG02pym4XibfWplMvBb4nTSxzJIuD7kKwt8/oUbl
 fZmxX4ILQZSUk5uJF7l9HM5XCyngGJJteZT2X6LOHFPjvMAvGLD5x4iiM0SHyPkpqNHU
 B8HO+e701eSARlMTByXmWlnLf0w/rv1qgCgsA8GsKM4eTtt5EF10PIDC8il7kyE8H2aH
 Rxo/W4EAKucYJ2FK4gH7kCD2BK0Ab/pAzIlkLNxlZypojJU1uNUTx9WkFXrVRKkMUfez
 h84Nu3nyxsKq+nGhMISCZ6dABqNxiEdLOeOfw9ToBtOoG/cHKcXpLujtxg+5IHEA34cV
 OsEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680043088;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BOwWonrpE9Dkyy4Q/0LXCbY8zJnCltM/M3j75FmH7fw=;
 b=pE7xqKcSIh7xYmvhaHlZyp7vYp/tzjr9dUObbVQhjEcTk+Xd81efmFl6TdH2/MpV6U
 rW2O3rWs5+fsx5a4bmMsUEcOcyKkezHHQe0owFBQrfKjm1Dnle8t32JRSUuO7ZK3EGJ8
 6cNjn9zOgMBANe9pSk4KzxX9fDDpvZhSyV1fxKfNaWZRgbYBdy2gnqeQ5HxUFJMO13Z7
 Pl/XkVIAezLgVzBTeVl2tzHgvNuDnReTimBiYXO1MXjYn+5vg7d5tRvNx15lzXG8ib4H
 ZP3tXKubCu4/3XPf8AaAVksP9TQ9siAe6ya0M9Q2Bcl02fztwrk0tBgD1KN7KIfcX9/A
 tnqQ==
X-Gm-Message-State: AAQBX9fnyED/9hzCNCyUMnyNzXGma6Oe7pG2kYinqBJnV7G1Q2unwL0v
 z4vlIPjoQbLbU5U56hhaVaN4fcRlDSckwCJ8lbg=
X-Google-Smtp-Source: AKy350YBE11m41SRDzdOvavHBzk6Aq12RlAFgkaKcKonlKYiYOP6aknoWHMxpgUB9rOLDfqF4VKkdw==
X-Received: by 2002:a05:651c:153:b0:2a2:781d:2c5f with SMTP id
 c19-20020a05651c015300b002a2781d2c5fmr5335225ljd.39.1680043088731; 
 Tue, 28 Mar 2023 15:38:08 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 t22-20020a2e9d16000000b002934d555783sm5199522lji.6.2023.03.28.15.38.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 15:38:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Leonard Lausen <leonard@lausen.nl>
Date: Wed, 29 Mar 2023 01:37:53 +0300
Message-Id: <168004255465.1060915.4281864962908827878.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <6f33219dc848ccd7122bce6933338033aa18c33c@lausen.nl>
References: <6f33219dc848ccd7122bce6933338033aa18c33c@lausen.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dpu: Add support for AR30 format
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Tue, 21 Mar 2023 02:58:04 +0000, Leonard Lausen wrote:
> Commit da7716a249b699978fb5 ("drm/msm/dpu: Add support for XR30 format") enabled
> support for the 10-bit XR30 color format but missed enabling support for the
> corresponding per-pixel alpha-blending AR30 color format.
> 
> Declaring only XR30 but not AR30 color format support can trigger bugs in
> userspace. KDE KWin compositor versions prior to 5.27.3 for example prefer
> 10-bit color formats, rendering a 1cm^2 black box around the cursor due to
> missing per-pixel alpha-blending.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: Add support for AR30 format
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a8318110b987

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
