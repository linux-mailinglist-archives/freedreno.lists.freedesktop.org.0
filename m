Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D4BAC84DF
	for <lists+freedreno@lfdr.de>; Fri, 30 May 2025 01:15:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AD1910E283;
	Thu, 29 May 2025 23:15:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eSXkEdKV";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC76110E78A
 for <freedreno@lists.freedesktop.org>; Thu, 29 May 2025 23:15:27 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54TC1OeX008024
 for <freedreno@lists.freedesktop.org>; Thu, 29 May 2025 23:15:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kX7efsc+IS2/784jVqW415KcZ7V01+TYXKPRgFgJmG8=; b=eSXkEdKVaeU3v7Pp
 x5jGtq5KlfskOfsXmQ7UPlUErWjQ01zFJI7mP8oORmLZy96DYDA82kap14XFkI/L
 aQu4KaGOxcTdrv+pXUUhu//ti77g2G+ycy7kuf4vYY+39FtQJYjfAgWiA6dqEzgn
 Sw1k0vcUYUmUqC5ibN8c7LUdjlaO1SbX9k5ezZZgHLGnmN7RPSG4K9FYyVXzQn/P
 59qICEAD6zD0y+Z1zu3U6XG1iwBNkErExbcjdVYup85kqGYN/YAsHE7wsYW5syRV
 h7in1HuTZqol5BkLTKANsLL3EL4UKQV5B/QNU3N7to7Vw/ie3LvFjco7HnqY0VKo
 X7bk1Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46whuf7jmu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 29 May 2025 23:15:27 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b26e33ae9d5so1599940a12.1
 for <freedreno@lists.freedesktop.org>; Thu, 29 May 2025 16:15:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748560526; x=1749165326;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kX7efsc+IS2/784jVqW415KcZ7V01+TYXKPRgFgJmG8=;
 b=jJQqV1KO0v+chmYKt+C6Cz6YxXZZaKHcn1+cbwWlceRXCJE/Gx75/nzT45JlLm+FD/
 K+se1wD9pe8/8hITp5gl3kaVG9C1zOYvRQCuF6+rwQA+OJ13gvXloDAqt8aFi6Dwj7f6
 sEXobXTVaCxI/3KaJi3WMCDP85kpt/BZlPSmRf8NDS6y9YnU48xNbh11KacQRwgc5SkM
 UWab+8nR+/1G5V8JA/FDuxhQqNlLINSToOoSMFAKf2wvsY+sfMYNXlwTraJRGA8gW5U/
 6ecibZWVMNOfUGGfKgQbwD7ycODll/wz4PsY5Vlzm+GuLVRjJrFO2SPjkyzPP9ACHKRp
 W6Tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUf1USVKnIa4XO9aVDKnsQVtiaLZPZCw6przwpsbowmDmxosW0ZYz8boLSrlHkXEv0i6bUmCdBhtag=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yywe5T/nIXDUn4vYAYuBOljLCd5Xgz77fUqRmhON4vH44iIDdqz
 Rcd8tAkvvo9/gmGt0SUS6/Tbjew9KvwexYkToHq/1g7SKcQACVQkLxt1KzYv7N81QEinXwHhNK+
 PSQ5Etpw64Ox10wpdZ255pceFXZJyFAd9moOecq97CEOYJ/huiXcDoCwFmfTSVoOOhgCBQbU=
X-Gm-Gg: ASbGnctbSx3Q59uAYEAfe1jEBprAIbDZavyJ6cokC6LRJsxxbe3rzkzyY92vkemYOkS
 5XePFs20yswWqf0IenvvRjmYTjH+Cu/ALMxLNQOcpG34w1grdNkaAgO1g8dOx4n0ZPUr5svtJHI
 kA5ZzP7HmgvqHOoEOAeIpXUSHh6D+8C4z9L61p7HrcKhiAyARRgc5lSuarZ5Vam20OjMyVhuAwe
 LSd55aZQhOPbpMJSPhyfTId2QLBqLDNPTOh8StMjn78VpQjwRwJWoV0gGlgOnIPOXa7NXPwz9sg
 1DNZuHcuCroaCw63wLK23go7sNhIam3Cn5vY9/TRJli+0gUmQUkHUsw//cD6MLAo28PaQO4J
X-Received: by 2002:a17:90b:3a85:b0:310:cea4:e3b9 with SMTP id
 98e67ed59e1d1-31241ea0309mr1550088a91.34.1748560526429; 
 Thu, 29 May 2025 16:15:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEA3THCormTux9QWIgYTb/ZoeNKtEa6RR3lUUxnW6L7Kha6SEXPkeVkPdWWJIZrBpa4PAFunQ==
X-Received: by 2002:a17:90b:3a85:b0:310:cea4:e3b9 with SMTP id
 98e67ed59e1d1-31241ea0309mr1550058a91.34.1748560526083; 
 Thu, 29 May 2025 16:15:26 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3124e1f3f22sm73581a91.0.2025.05.29.16.15.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 May 2025 16:15:25 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Thu, 29 May 2025 16:13:45 -0700
Subject: [PATCH 3/4] drm/msm/dp: replace ST_DISPLAY_OFF with power_on in
 msm_dp_hpd_unplug_handle()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-hpd_display_off-v1-3-ce33bac2987c@oss.qualcomm.com>
References: <20250529-hpd_display_off-v1-0-ce33bac2987c@oss.qualcomm.com>
In-Reply-To: <20250529-hpd_display_off-v1-0-ce33bac2987c@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Doug Anderson <dianders@chromium.org>, Johan Hovold <johan@kernel.org>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-kernel@vger.kernel.org, Yongxing Mou <quic_yongmou@quicinc.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.15-dev-64971
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748560520; l=1160;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=fcV0U0JSd2Lf4fDNNX9R4rq8oAhewquvTnMKQsk4vw4=;
 b=L/EjQFUOVbqSjowt+2F3fUU1pQgDZXxeNd7PyBfGd52nFzJc3fw8rhldR4/xN61sS8wqJ+6KR
 nwQbP8lg2FaDS8cHgMf5lKPSyxMS6ZmgZItPDqtcoKXmLuD3U5u95KC
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Authority-Analysis: v=2.4 cv=OslPyz/t c=1 sm=1 tr=0 ts=6838ea8f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=8oAJioj0-2SxPtK92HsA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Qq9fcikzffhZmL6DMNNYDVzM9Az0qeLI
X-Proofpoint-GUID: Qq9fcikzffhZmL6DMNNYDVzM9Az0qeLI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDIyNyBTYWx0ZWRfX/hmPd6l+z6XQ
 XQImSQF19pDt3WNq89QXzb70n98hh9vsKXkbwSf0sXnLcyzEzGeoGgWOtiIPPB867d/bhu48b6G
 iMjgIOiE6MMcstSxhP15X8ot23bwhFAA5IcCe6WDSF/2nyV5tFMx7aKgmQsDFzMVBEgPL7qYewW
 KsLzCaIAxz1ziIT1kMYKCeys34fkAjx8Q/5Fp85DhHANsdsIJCIBi11NH1jwALOuEpD2aTeHAIt
 W4Xzyt+L8Z6g8eFcPjVUSrq3qrTLqKwar4Y3eWi8zuX5ijzbMjYCoAgf/+yM/EFeH0qCRqux2ko
 Lp1df9tFOYXTd3iN/HmFWzld/vou0l2t/IUMeMGjIQtz1qc+CJL3VyG++zghBWG2lhtaUmcWko3
 zxeiXt742Tg/G7CxjeK5gOg7z++JW968ARt1q6ByrA89bOwYePtjXPNUoCKY25vBF6S0lKIY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_10,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 mlxlogscore=786 adultscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505290227
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

msm_dp_hpd_unplug_handle() checks if the display was already disabled and
if so does not transition to ST_DISCONNECT_PENDING state and goes directly
to ST_DISCONNECTED. The same result can be achieved with the !power_on
check.

Replace ST_DISPLAY_OFF with !power_on to achieve the same outcome.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index f2820f06f5dc..785c813d2b31 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -672,7 +672,7 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 	 */
 	msm_dp_display_notify_disconnect(&dp->msm_dp_display.pdev->dev);
 
-	if (state == ST_DISPLAY_OFF) {
+	if (!dp->msm_dp_display.power_on) {
 		dp->hpd_state = ST_DISCONNECTED;
 	} else {
 		dp->hpd_state = ST_DISCONNECT_PENDING;

-- 
2.49.0

