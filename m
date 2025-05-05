Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61960AA8A91
	for <lists+freedreno@lfdr.de>; Mon,  5 May 2025 03:10:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C4B110E1C0;
	Mon,  5 May 2025 01:10:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bl74nD5z";
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nAiW8nE/";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE78010E1C0
 for <freedreno@lists.freedesktop.org>; Mon,  5 May 2025 01:10:30 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544NYDTh006027
 for <freedreno@lists.freedesktop.org>; Mon, 5 May 2025 01:10:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :list-id:list-subscribe:list-unsubscribe:message-id:mime-version
 :references:resent-date:resent-from:resent-message-id:resent-to
 :subject:to; s=qcppdkim1; bh=v2F7Z22Vqvpmj5OI5DLRf+E6nF4Jvc5Wh4o
 to467bgM=; b=Bl74nD5zFo9g29IYzqllP2xvkdafZI0wWhzWKqE8yx4zy6YJxKZ
 3GjOiqjf++jj8ED3xtbtF6JzF+lKz8lFE5S9Mx/DwMlDeiwVICTPWVGsO3ePIztJ
 qwRDmduB85ewQ8LtJcfhEnIjzliZQEF5jYTUh+ha39+pEeCgLakTZ5TBHFeUR4Ki
 O15RgzCsRmrNjRDpWofAYxQENEnzJdcMHx06KqSnVMsdqEQSiKIlKmOuTBv1CV/q
 mp8PsvROZPd/8P/5r+tUeGVxHzGo1zRefxbOf5m5EzGiDMBjWrrqI0niVBKYPhkT
 thKMwzMWxG5oaqyzXgeqY777iPbBVi/6TNg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbh7anrx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 05 May 2025 01:10:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c9305d29abso763599385a.1
 for <freedreno@lists.freedesktop.org>; Sun, 04 May 2025 18:10:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746407424; x=1747012224;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:list-unsubscribe:list-subscribe:list-id:precedence
 :subject:date:from:dkim-signature:resent-to:resent-message-id
 :resent-date:resent-from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v2F7Z22Vqvpmj5OI5DLRf+E6nF4Jvc5Wh4oto467bgM=;
 b=MLXV/1V2nMpu+20wc3FIeIK8535OMLELZId7QEEI5NDYH09jxqStstjHayJW2AfzLy
 ZXsEU4AuBNftBUYHjJtU/FeDROek8pNLbhaMRFMowkFgrKsU5jEKHhZvHNQV+O3MhJnL
 EgHqVE9voWB6dvH2sPEzeT/bDlra1X6DKqQGRjgOORTixq015LVe9WooGJLbGVoY/NUC
 RqztEstD7usSL5nLSADubOFs/q0dUp1sfcnwBarJnWwAvxj9yIQSODKwgSqHjPwhjXEn
 f0drzE/w3OHVW/+Xp3obtp7zKE06Je9u+I8XU/KkHIRclthBrBOhndNyGOQ8Mnhkmuon
 Ypvg==
X-Forwarded-Encrypted: i=2;
 AJvYcCUBnAs6Qu6XEzHB6lgcxPeVEY8KgePWOEK6hqHKr1Eoc6GKEYpHGEn18ZdePupYKvAJsvWV7vY2V6M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBUy7H8QlUKyQxFhdadArKjkbXCwthj8bd2vjACKm3plp9AU4K
 v8Ox1GrqlW45v+Y1a+YjldPtJr9eD64j6us9r2hG8JZ+thVhTvUajVaL+YxNPspngpeyJBV+oXg
 ydi3WJ6hCe5S8lJnpbXn4UPVTJi7k8RmBNsjoh5LgFnoG6tJBN/l9apjCpFEpq5nXmloiYaE8Qv
 M=
X-Gm-Gg: ASbGnctEQ9U04axrODmiXHaoWBcVktzvPGkqIwPRAV6zrRRkW36lztev/WYzsqR+pGU
 HtJh8Wy6d/6R8EJctDITIhNWXRgiPJ89+LiWHhpPaXUnenhJn/PE3cna7fPJTSBoTQn2rsJzBbm
 9NPNVRPAMS86pBGsm3IqTQQgUelk+ufPyzpDm9tgd1PvRc3kUO73KcfJ0E0hN3Gd1IWv5wcDRk5
 MBKOPSkTq1pxMvtDztwJaqSYIi/7jzTTePgOfGub6SxU4ZlHQVK6tQ1kgbbyV978usZINjjnVzg
 XhKnwV+kBVyezrQNmhX5Hc6mrxCVKpwMDEEij0yG6JlrgFruF+9h1eZuVd3Q2Y+zKUoGCiN6JOQ
 =
X-Received: by 2002:a05:620a:8006:b0:7c5:a5cc:bcb9 with SMTP id
 af79cd13be357-7cadfed9421mr1169284585a.56.1746407424452; 
 Sun, 04 May 2025 18:10:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEhjgVOub9TwwUqEQkSsFk0sRf8VzC28pa88RmOrM3QO6nSyg0ypTwQU2/Gdyjlsqfz/+bdA==
X-Received: by 2002:a05:620a:8006:b0:7c5:a5cc:bcb9 with SMTP id
 af79cd13be357-7cadfed9421mr1169282385a.56.1746407424098; 
 Sun, 04 May 2025 18:10:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94f186fsm1481881e87.169.2025.05.04.18.10.21
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 18:10:22 -0700 (PDT)
Resent-From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Resent-Date: Mon, 5 May 2025 04:10:20 +0300
Resent-Message-ID: <b4uogkfltl5cwfaywzogxh6yjzg4z3xjlk5ax4wdt4vn4q7jls@ushfrhfn7kml>
Resent-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C3413777E
 for <devicetree@vger.kernel.org>; Mon,  5 May 2025 00:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
 arc=none smtp.client-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
 t=1746404121; cv=none;
 b=HiqtjW2RxlvlpG6L/R31YeSacA9XcqzoDiiwrL0jlTjsFlQgEz6U359dwVNKmlAAx3c/Hi2g6QzLGkhSV4VQskNx9KfP13xsI0TEpo9v5x6Seo1WhpHxOq7cUzKVTEZKhxeIuk7Zy+7Cdy2dQF15dCenoIi23bwuNDfRnLPjPuE=
ARC-Message-Signature: i=1; a=rsa-sha256; d=subspace.kernel.org;
 s=arc-20240116; t=1746404121; c=relaxed/simple;
 bh=yxhAip+pU59d1DqmlgSeZ4LDkSEHXaDc7qVKspiiNHs=;
 h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
 In-Reply-To:To:Cc;
 b=rAKe3iIKS9a7XIqSua3U0DkJY+ehvjCPsNI/Fyl1yaDFj+nJlhDEtHfPD3NtHmYdl2E+Xz+V6tFSKnItLK+ynlRMq2LTrqRXwKqK5eEkbVk+uHuwQA0tnkxagzucWKN3gcdSslZuSnSFu+os8zS0Ojioxw5YqHjwjDPBcnXLEDg=
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org;
 dmarc=pass (p=reject dis=none)
 header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com;
 dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com
 header.b=nAiW8nE/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org;
 dmarc=pass (p=reject dis=none)
 header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
 spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
 dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com
 header.b="nAiW8nE/"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544MKows001685
 for <devicetree@vger.kernel.org>; Mon, 5 May 2025 00:15:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 v2F7Z22Vqvpmj5OI5DLRf+E6nF4Jvc5Wh4oto467bgM=; b=nAiW8nE/itp0xVjY
 YUPQ9BUa9ZyG0iW0m9aLQGvyqzAIpH/uRS0kbvofPJHcAEEeeGwErdmbMjuzO+z0
 e4XtcpvUWGBmS1w5BTgnrep4Wlde9EufgKYLUx3RKytC1W6jOoC+vbMc6EyLwssW
 hMycCqHm6KmsjpJi6vxmBT9hX8GMo5IrFj3kCntI2HEnff583obp8i5f9qJf4v8p
 2l/CXNexgEM0vsgtYOhVNkINSWDjDKR6D0RZtzswS67SEx6T13gwm0gjosMDAiu2
 nft9fbUZAj2FGU1IWbU9SaNUPs31i/KnFfkl88PnIpQYY08ue2zgV3EVZidtyy1F
 E2SSXg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46da3rtpny-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <devicetree@vger.kernel.org>; Mon, 05 May 2025 00:15:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5f876bfe0so676610185a.3
 for <devicetree@vger.kernel.org>; Sun, 04 May 2025 17:15:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUOAj8wNjWjjtGy5M+C1BtRh6R6sN9SgJUkq4Xkr5koLgXqObzQPGqNjHnJ/m9h3wDvMjFaj44MUr8w@vger.kernel.org
X-Received: by 2002:a05:620a:2685:b0:7c7:a537:7ce2 with SMTP id
 af79cd13be357-7cadfe17315mr802247685a.32.1746404116395; 
 Sun, 04 May 2025 17:15:16 -0700 (PDT)
X-Received: by 2002:a05:620a:2685:b0:7c7:a537:7ce2 with SMTP id
 af79cd13be357-7cadfe17315mr802244685a.32.1746404115996; 
 Sun, 04 May 2025 17:15:15 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94ce656sm1454066e87.105.2025.05.04.17.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 17:15:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 05 May 2025 03:14:52 +0300
Subject: [PATCH v5 08/13] drm/msm/hdmi: add runtime PM calls to DDC
 transfer function
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-fd-hdmi-hpd-v5-8-48541f76318c@oss.qualcomm.com>
References: <20250505-fd-hdmi-hpd-v5-0-48541f76318c@oss.qualcomm.com>
In-Reply-To: <20250505-fd-hdmi-hpd-v5-0-48541f76318c@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1630;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=iRrggYdOsfyNRF7mD9CF5dLKTnVLk9gbl2tlKLOnDn8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoGAL81jAwp87jlj7ePL8czNId/7xi5vSBolYDO
 u7aLLeOGLqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBgC/AAKCRCLPIo+Aiko
 1ZIrB/9urrL2y3ZvkQ2p9CqGK09lcSPj2IysMUziduCLEJKZVJY1Unqn29EtfW09+necJx1FnMu
 Oh1wVjrwn93y14OfZUCkCZj/VuGWmZrHQ2IiCbxAViknRVwNZwHh+SwCKKFz5PmFVRLpqF7UrIx
 lbfr084Ct04AbBoBdVZD2RpfCWmOmm4vfSowLzvpL2RYSix3bg30smbVtDZ0MKDy19qbyEbfmnY
 8BuWNgbVPoGwVrWOWeoynq6TJE3KY5c19DId31Pr0TzKQMEaKnSONTJGKFr50R8fC9Fry/1BX8q
 PX2DyLakLBKEigIRXub1o69z0JHanZVTsxpo2CVxkT2d5eOo
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_09,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050000
X-Authority-Analysis: v=2.4 cv=fMY53Yae c=1 sm=1 tr=0 ts=68181001 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ihqtQN7mmqmTXX9nVePWgw==:17
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=68fdCqVM_EMA:10
 a=SKaEv8EmnvEA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=bgq6psdzRVsaJitvC04A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 45AIq5yEVyv_49Ib985aJ0wk8K4y2Vwt
X-Proofpoint-ORIG-GUID: 45AIq5yEVyv_49Ib985aJ0wk8K4y2Vwt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDAwOCBTYWx0ZWRfX2I/S9l+l/GZ9
 U3HuMoxmiCnh7kwogpq1EgVA1ShVhUWohDxGtMjSd9T74OLIsAmARc5jZ1NHfVsF8080RYSZ3RJ
 9rUTAE3YpX9TUwJi8eF9ihggAnGGWZkVqq8vQXDYrvwMypxY5X4zijIO7OC1cjxAJkNqgAY5rJY
 XDZiyPbB8k86KNR7slCSApovsEQxfZ7KF4nOfDjNKBBgQbCJrEfg4cOry328I5ZzzYwAQpLyLKo
 W7cbL3bmrxGxts2D9K0GKrFbUBIg6MfjXhKaF2PuNHKK7QxboVBH1tAsRwARXriGsZ0errHN5jm
 Igr4gbN22NrSNWF6HmiiabfTmubbwZgoNpv5OdKZUc3hyEyZLdOI+lKCli2B2qj1Yi2MYTg9joB
 kjAZESvR/Fpg46C9+r6l/f+c2Vn+AYbjzZdQF13M+3zSvqioIgY0GZQ7+JXkPVlHgj3KMt49
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 mlxscore=0
 adultscore=0 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505050008
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

We must be sure that the HDMI controller is powered on, while performing
the DDC transfer. Add corresponding runtime PM calls to
msm_hdmi_i2c_xfer().

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_i2c.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c b/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
index 7aa500d24240ff3ed6694c469eafc4388c982346..ebefea4fb40855745001ed97367d571bde28f413 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
@@ -107,11 +107,15 @@ static int msm_hdmi_i2c_xfer(struct i2c_adapter *i2c,
 	if (num == 0)
 		return num;
 
+	ret = pm_runtime_resume_and_get(&hdmi->pdev->dev);
+	if (ret)
+		return ret;
+
 	init_ddc(hdmi_i2c);
 
 	ret = ddc_clear_irq(hdmi_i2c);
 	if (ret)
-		return ret;
+		goto fail;
 
 	for (i = 0; i < num; i++) {
 		struct i2c_msg *p = &msgs[i];
@@ -169,7 +173,7 @@ static int msm_hdmi_i2c_xfer(struct i2c_adapter *i2c,
 				hdmi_read(hdmi, REG_HDMI_DDC_SW_STATUS),
 				hdmi_read(hdmi, REG_HDMI_DDC_HW_STATUS),
 				hdmi_read(hdmi, REG_HDMI_DDC_INT_CTRL));
-		return ret;
+		goto fail;
 	}
 
 	ddc_status = hdmi_read(hdmi, REG_HDMI_DDC_SW_STATUS);
@@ -202,7 +206,13 @@ static int msm_hdmi_i2c_xfer(struct i2c_adapter *i2c,
 		}
 	}
 
+	pm_runtime_put(&hdmi->pdev->dev);
+
 	return i;
+
+fail:
+	pm_runtime_put(&hdmi->pdev->dev);
+	return ret;
 }
 
 static u32 msm_hdmi_i2c_func(struct i2c_adapter *adapter)

-- 
2.39.5

