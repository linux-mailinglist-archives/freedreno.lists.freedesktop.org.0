Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA89A8AD75E
	for <lists+freedreno@lfdr.de>; Tue, 23 Apr 2024 00:41:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14CF8112E01;
	Mon, 22 Apr 2024 22:41:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PE2q5ShM";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BE46112E01
 for <freedreno@lists.freedesktop.org>; Mon, 22 Apr 2024 22:41:44 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-51ae2e37a87so3525245e87.2
 for <freedreno@lists.freedesktop.org>; Mon, 22 Apr 2024 15:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713825702; x=1714430502; darn=lists.freedesktop.org;
 h=to:content-transfer-encoding:mime-version:message-id:date:subject
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=DnA8X22i2kJ7S49+cOC1P/59QG3FgetaGzDVYWU9k2U=;
 b=PE2q5ShMdhE2x2bxkEZfSh2urpC+Cp8Slyl/XvKFRyMzQNwwl1TJExXipiWYcLldVb
 wEk4HPb0Y0bL4ALvoKy0Cfpgs+1WYvLv+uY1xcxKOAmp8R09MhVR1sF4kUB5NqWy3/EX
 tSE6ZZhPfRog0JN7T8E47f/mf6zpyFBTXsfYik+JZuhGEhjyxx2nVJ5rzoWMvmhdOkRN
 7QF0Dh/svN78fCclFOyUoEhvIX4fTQHtZEmuPESoIZVFMj4G2RFl89xXePx36aJH7mfh
 G7yTPiS20m4jRT8UKil/x0HEvTvduM9bd8AUITG+Cnhn3wEJNcTajg+MFjc/EP/fRcl2
 /VbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713825702; x=1714430502;
 h=to:content-transfer-encoding:mime-version:message-id:date:subject
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DnA8X22i2kJ7S49+cOC1P/59QG3FgetaGzDVYWU9k2U=;
 b=XqUPGFGNKIA1D4fmA/3YRdlAYbMFUhS5KM9U1A9qePULQnsSG3ePBgrnyAcLheCsir
 NrXEoWFAO3wfkZhjyUM+owoLQd7hKYxPXHDOu43MR0fKn5lwC3OqyOacEINnwvIj2leC
 aAl5FVBppuuqsE9lOzdm7coLaiM5lQJCzLDUrPstCrovYcuidY5ShC1+mYzQqHkkgd2L
 7WlnsTdgEMzD1W9H+uAv9wwufdN5SyC4YSSA1UZiAFm7ePAhXdl3OhoXib9mHm8OAmaf
 CtUf4ughgSDGCPanWrbfqip9FrnjoYhLNRW0WmJJZRY7qX19gusrUn+ioxyY348bos2X
 LNKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjVUnBN538Y1gI9ZdQuaKxLNJHUYSf0xaJBWiX3mm9q4fKiscbgam/fRn5L3JcbmhO8ErV9MbSHL6FCt01ZBuv7OGPQgQpb/xOgttzLqoS
X-Gm-Message-State: AOJu0YzVUxetMgWidhC+GIBXn+5o9c3DF0LwFspQf7g8rUSmYVKwfuSy
 lzMAycemtsPQbHqyQM2RzQkQi8sYrllO8gPjsWjS0AAgX1Tdewp/C7UXFl8D01k=
X-Google-Smtp-Source: AGHT+IFr3ze2L9UOXRY+Ko4np4lZ/ON/DU81SEnl00esnQMAOqb2JOt/nReNl7j6SqU9SDgseEwR1w==
X-Received: by 2002:ac2:5de9:0:b0:518:d829:4bae with SMTP id
 z9-20020ac25de9000000b00518d8294baemr6813728lfq.32.1713825702513; 
 Mon, 22 Apr 2024 15:41:42 -0700 (PDT)
Received: from [127.0.1.1] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 q24-20020ac246f8000000b005130ece9099sm1829517lfo.277.2024.04.22.15.41.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 15:41:42 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/2] Adreno MAINTAINERS modifications
Date: Tue, 23 Apr 2024 00:41:30 +0200
Message-Id: <20240423-topic-adreno_maintainers-v1-0-21e1adac2c13@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJvnJmYC/x2MMQqAMAwAvyKZLdRYUfyKiNQ2agZbSUUE8e8Wh
 xtuuHsgkTAl6IsHhC5OHEOWqizAbTaspNhnB9RotMFanfFgp6wXCnHaLYczQ5KU8YjazbZtqIO
 cH0IL3/96GN/3A+uQsOZqAAAA
To: linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 freedreno@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14-dev
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

Separate out Adreno from the rest of the drm/msm driver, add myself
as a reviewer for the former.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (2):
      MAINTAINERS: Add a separate entry for Qualcomm Adreno GPU drivers
      MAINTAINERS: Add Konrad Dybcio as a reviewer for the Adreno driver

 MAINTAINERS | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)
---
base-commit: 6bd343537461b57f3efe5dfc5fc193a232dfef1e
change-id: 20240423-topic-adreno_maintainers-4d220cba75e8

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

