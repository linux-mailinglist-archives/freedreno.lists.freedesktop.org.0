Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEC593D1F2
	for <lists+freedreno@lfdr.de>; Fri, 26 Jul 2024 13:18:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF2110E95A;
	Fri, 26 Jul 2024 11:18:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DR/jF33M";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC38110E954
 for <freedreno@lists.freedesktop.org>; Fri, 26 Jul 2024 11:18:42 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5a1337cfbb5so2613950a12.3
 for <freedreno@lists.freedesktop.org>; Fri, 26 Jul 2024 04:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721992721; x=1722597521; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+RSSre3AYsx9Ck3+Gf7pgOKZ6yzR7bvdD8OyLOsFucA=;
 b=DR/jF33M1zHnljJqyUdl2dIhqiyQMIV8SsDB2hJiJun3CzIhlruMl/u466eY6Uvj+t
 9l8Tt4zNV5JOTEQwA8fGT5i963Q5l9Ui3vpOGNTRPjmclKtYNJrF6NwlXPAaswHdVoas
 qHcwIpgjMBYbeRdqlulMtXNUG/US2/ybvH5kxn5fB541TCpoNXCFxjvK48+kd1+n5M7t
 w4nb38wuXtx1gbQhKsAzhiMmZv78WqLTZNivbPLxLlKqlDSDSD+zVKv/xJlC5O4/cWjS
 DqfhH2OFs9D+DpegfQbUx0t/dXja2Sm+JUgqBnYt58d2uFwnlXi3JmMiVepNacmHM9df
 U27A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721992721; x=1722597521;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+RSSre3AYsx9Ck3+Gf7pgOKZ6yzR7bvdD8OyLOsFucA=;
 b=hTim0kDGQX9Qln7JvMDGCbcDETfEIeIb4BJuOGR+nKDnWKF606+oUHRoYvX4WQMIfQ
 ysdWmeOcTgBME7BiArGh8ivXpBRVxivsRmDpbLCvji6U4ugNHV82eS56uSJK6Y8aFpgx
 QEAsJv25wZwixaC0oVVnJZkDyUA98Vb1RlqwRhf5pZLV8gJVcJpdfQyvcB5irOTqAfSj
 4N9mRmgaZd8YKmRg0Rdwt4yajGiSqKlLGUOpN5ufjUTt9NOfVo8nQHRwhXBsShjw4HbQ
 hZnDqJ6zMMFA42vVOhUjP/pjsGiWfMD+aK/MuPdB3Krxcb3CisBQuYmJKWUVSYk6d8wI
 Hg+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUg96ljzrWqTIWfLdhy3TgvIFeiS2/zXGxlj2IpPQWlnYMjuykLcrDc+rLEV2HM0mBxEpIIziyuRcLOKSyVlB5Kzzdo/e/YdjOEl7ub1SzN
X-Gm-Message-State: AOJu0Yw1nW6xAdrQ4Xw+z6TknrMhwhmCfqKfOxCX2yz79cwq3FUuPV+R
 jYHP482+vkEmxwzESa6H3ilgooqpQnBmPuhhP11PfBvIYqjZTdJbseZMb89IGKg=
X-Google-Smtp-Source: AGHT+IGedxxg/izaM1e+VztqZWQWxkaWXqj8R3F912/FfkJgI46WkcgQ7+j+9WvvDIum0fdm0GHjIw==
X-Received: by 2002:a17:907:6d01:b0:a7a:a0c9:124e with SMTP id
 a640c23a62f3a-a7ac4daffe8mr483108366b.4.1721992720735; 
 Fri, 26 Jul 2024 04:18:40 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acab233aasm164703166b.8.2024.07.26.04.18.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jul 2024 04:18:40 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
X-Google-Original-From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 26 Jul 2024 13:18:23 +0200
Subject: [PATCH 1/3] mailmap: Add an entry for Konrad Dybcio
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240726-topic-konrad_email-v1-1-f94665da2919@kernel.org>
References: <20240726-topic-konrad_email-v1-0-f94665da2919@kernel.org>
In-Reply-To: <20240726-topic-konrad_email-v1-0-f94665da2919@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-pm@vger.kernel.org, iommu@lists.linux.dev, linux-gpio@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721992717; l=857;
 i=konradybcio@kernel.org; s=20230215; h=from:subject:message-id;
 bh=ckCyUrhBgaUj/zbznCBeQ3fcpP9VdQ8U2iRFPANaIoI=;
 b=CNtGakN4VUWxmqa0J8qCXm3ryhK2xBygjVnd3sLEs1hjjigxFk6KXgVO8RguVUgvC2vrvozQN
 0TFoswoCFN/Bf5JR+kUjCYQ/6OyAUzfDbdzncCFa0m34zezBQ43DbYf
X-Developer-Key: i=konradybcio@kernel.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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

Map my old addresses.

Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
---
 .mailmap | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.mailmap b/.mailmap
index e51d76df75c2..d189c6424697 100644
--- a/.mailmap
+++ b/.mailmap
@@ -353,6 +353,8 @@ Kenneth Westfield <quic_kwestfie@quicinc.com> <kwestfie@codeaurora.org>
 Kiran Gunda <quic_kgunda@quicinc.com> <kgunda@codeaurora.org>
 Kirill Tkhai <tkhai@ya.ru> <ktkhai@virtuozzo.com>
 Kishon Vijay Abraham I <kishon@kernel.org> <kishon@ti.com>
+Konrad Dybcio <konradybcio@kernel.org> <konrad.dybcio@linaro.org>
+Konrad Dybcio <konradybcio@kernel.org> <konrad.dybcio@somainline.org>
 Konstantin Khlebnikov <koct9i@gmail.com> <khlebnikov@yandex-team.ru>
 Konstantin Khlebnikov <koct9i@gmail.com> <k.khlebnikov@samsung.com>
 Koushik <raghavendra.koushik@neterion.com>

-- 
2.45.2

