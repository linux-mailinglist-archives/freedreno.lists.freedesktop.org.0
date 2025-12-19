Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 795EFCD005D
	for <lists+freedreno@lfdr.de>; Fri, 19 Dec 2025 14:20:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B4010E7A0;
	Fri, 19 Dec 2025 13:20:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dcfyx/aZ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fm8AJAvT";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10E9A10EF16
 for <freedreno@lists.freedesktop.org>; Fri, 19 Dec 2025 10:39:22 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BJ4d1iR3320327
 for <freedreno@lists.freedesktop.org>; Fri, 19 Dec 2025 10:39:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=5WpkRzSjWUQP8YT/iPdEOd
 s5AwcizwNwKhZAwGdgqG4=; b=dcfyx/aZ0inFWrCsE+V0e48utFdMCeCYtOOeQf
 WZQDSjLYkXDgpGLx6WQMCjHZ3NtHsNZ8PyNNlG7pPnHSBrT3SBfcLvTF3/ETIhgN
 dmYBc2u6STU2XlOAhHhZS09V4+PFg1bYuFhXw85qzJ/KBSSTubZF0t3T3JSQcufd
 hEbKV79LhDrN6/Dm8uuLZ+xKdb68dQtWDnuW3lfFPVbrd1C2OQ67P1pSjdKPqPtn
 Yi9a5trHL4IDPS4XFUqfGXgXauhhMsCYOvdmDTZO/EwtvzTTEcq3o0YzNuHXiXq8
 Kau6A0FJFZwtX25IxbmSHueIhRoWWvbAB46Zk4HeRRjv0JJg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2etadc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 19 Dec 2025 10:39:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4f4a92bf359so22749801cf.2
 for <freedreno@lists.freedesktop.org>; Fri, 19 Dec 2025 02:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766140761; x=1766745561;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5WpkRzSjWUQP8YT/iPdEOds5AwcizwNwKhZAwGdgqG4=;
 b=fm8AJAvT2+xtudz0XJrKJV73bYWqAI0hxRl1UB8lkoZbNvHjjtIa+8/o9dQNctvgq6
 X3T6fRkntiLKLAkVMhspxs3ZuoaAnMozTMM8ALJGHloX26NBQ2JTeepFvR3eu8mBGiJI
 6mIxz4aka4mcJDETsYAeMnuIb7qa5RJ9COVB4vqkexAfFBv1EoVJUK7d8/Z5TSxzj7nq
 Oq2jxkKYTfaTuo9H81n/REa3BEWzudukD6pirveKijY20BdspXjj6YXVIkB0172xe9ST
 Z0x28SRMKMeXlFM8gUa9SZ7mKpooPMsgiRuzTLo3/vm+dBZefMFxRM3BN4DBuufNMhWl
 GMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766140761; x=1766745561;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5WpkRzSjWUQP8YT/iPdEOds5AwcizwNwKhZAwGdgqG4=;
 b=ZeZzNYbP3SL2fdhWIfDuk4EaE2Ij12Gqw/N5mtd1J26SZDEN4ZoisjQ2HDqA3cw+OZ
 mVxoUC7AYfaMA9ymZg5hl1IDxwNSMuEerUaVmzSdwpGNiHD207mC+4mFbixwYMZ8YjJC
 0/PhRMmFcXqGwXUhj12WbxzhAZVMtMgWbjhZC76A1/aLR+dGb7fzPWG5tSwYWyUYWv6d
 3TnO0ZmFRmhqEord5gmKQwYGrrDCZfjzRmbh30yNHIW72EMiN8qt9uDFCVYxnpZQ1FtR
 AYiLzHxiGfiSRyehT0uNUZN4fhic8OSiRe7iOjST7bMKRqdova6+B2vqID2zPok3SHQR
 5G2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrfyPj6S6nctGK5ZhXNjN+6zpRVcXIeF2MAintVUE94lUpOXIlTC9veZ2shhGlPEdN3bcF1xy2vfM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIOZwmqvF69KjuGRK71TYUhBonn4kPwrlnMzwSgqMUUlgFikwu
 Rw1nnMubM4DM58tUkYTzKOujDg+ThbEGJ3XlqyB3AQqZYJWVO7hdiGZ/IvXVHv4GERPAtb/T4oK
 B5v4nU+Mkdi+IK22fiJpvhIHUWf2y33nT1z35E7/RVqvDAzz7Y1LSUdxR6bu1SnAqWyXp/0c=
X-Gm-Gg: AY/fxX4F7fXXkSXp8B45JpywhKR3DYO0JFKA/ZcHnIbeh+w2O3nWrL/EXiYGqxxwfQT
 xXEgx98ee0D+ogf3E3L7F4ryB9P9ebgCaTqsnT7YX5fEN5EOZvIZfw0jl6jz4oIQ2ZrMPs/tKaq
 8m0JnJ4XDE3t/QS/2hbbeRrZ5O8mncBwo4q0RSwQL+MlMlLX3p6Y9sUy3PKdTs7lAz73v93adJJ
 wpbwbtHfgeN+S8C6BODG5ymfeW6vmDNcyeDcMAuw98SiFSDoY1wY/WPECbix1lbGGtmq9AbAXlz
 3NqjcJrfALcrdPixY7H+FTv9/RgZHc3XJDoXg0mo0iJSHprE2XjSlQs1Zyy4f+fYMN7RskFgJkB
 OBrTv1R24gOyV2N8=
X-Received: by 2002:a05:622a:a07:b0:4f1:ca4f:d480 with SMTP id
 d75a77b69052e-4f4abd97f74mr34794771cf.45.1766140761299; 
 Fri, 19 Dec 2025 02:39:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG54uLQpoAtFj+oMXbNkbve+ZM6hf/DHjVt1IKUPcHqipmFzkeIxiVd9pxY+UmnT0HbF+zwrg==
X-Received: by 2002:a05:622a:a07:b0:4f1:ca4f:d480 with SMTP id
 d75a77b69052e-4f4abd97f74mr34794491cf.45.1766140760794; 
 Fri, 19 Dec 2025 02:39:20 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037ad8577sm198142066b.24.2025.12.19.02.39.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Dec 2025 02:39:20 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 0/2] drm/msm/dpu: Revert broken parts of the quad pipe support
Date: Fri, 19 Dec 2025 12:39:00 +0200
Message-Id: <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-0-654b46505f84@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEQrRWkC/yXNQQrCMBCF4auUWTtgQmuIVxEXTTPqKEnjTCNC6
 d2NuvwW738rKAmTwrFbQejFynNuMLsOptuYr4Qcm8Hu7WCs8RglYdKEsVRsA5IFn3WMWLgQBpk
 flNEF2/vh4LxxBK1UhC78/r2czn9rDXealm8atu0DxsdeW4cAAAA=
X-Change-ID: 20251219-drm-msm-dpu-revert-quad-pipe-broken-7b249567917e
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Jun Nie <jun.nie@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1312;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=/u3nvXle1xbqy/IuGW/9vL0OVSJ020YRlDEhrJxnPis=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpRStOgv3n6bkgMr1ZmWnTrO6Ri2kbxqxejW06l
 ip8nZ7X4KeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaUUrTgAKCRAbX0TJAJUV
 Vi5nEACtwbm0IopDWK5GIQKXH19r7MV9q7QjXyGuhaaElQy7myNtVLl4DD+JP9VY8KfRMQdDNxB
 N36gh5lsCDG+bNVKtJdJ2gANTEgJ3IhZxsuaNyQhj8iPLUONlxyS0ZEVm2kMzgL7Qew0mkxnFEF
 IdFKw74UFHJ6nRi5MvOiNkbeNZ2z2X/M5Oay5MuJ9n8bzTzaCqqcBiM374bvYVPTcjVv6QJVDB+
 yYnScHthLUmJio2uzCnTYfW490HE3UPeqGONcxHmZDZYXb/wgizy1idAJ4ktGtCVqMIcmDCQYL6
 X+BCZZWG5IhC3i775MdMYAMZL0WbrkVHSDGIlgcTcDzZ94sX2EOKV69ggBByj9qDx1Gf8aQVM+w
 c9yPPKS1MsYJomrebxP6V0ic6lJ0eaPaKzT03eAb7CZzmC4b04C0sZ//aP4h9u1520lGcdXnhxV
 sC031PQIRZhk7gjjKjVzQ3NXMkfv1VrYHPvvEAtT59LxUN3fCTZiXCGKWDdrCEd6zUvOzoDFgG+
 L/bsXrqduqxUVb8snRyL5NQOk0Vt8rIyZJnRRT/u0hdxyYaQ+Tpal0n5eYRhs3mMpHLGiLEnT98
 1FjAqGgwkiCnsRLqjvN6l2kI9B2HfiF6+UDnO1e3k6rmJkw2uhwHynUuCRrr2n6qeRmql3UHlgv
 BWr1/b1M5xj+zFw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: wIgW9Q8kGEIxkH8QOtXTAp8PFB9mPbl0
X-Proofpoint-ORIG-GUID: wIgW9Q8kGEIxkH8QOtXTAp8PFB9mPbl0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4NyBTYWx0ZWRfX4FfIdP+awwBA
 Zf8hkdOnaS4t+9aSU8mU90ADgzDrbMJCTcmqFW2gNU8CqB6sBIOmAYrhXzPjp6xqpeFyFFsluUu
 mxwoZGxL8p0Q2DUXq9pQJ6kwAdCr0ztBdNcwLtEz7iituuGkBuasYZfymI7N1LzL1O1b8nc7cc0
 YDNAv4ZTQC9Dt/pmHgQaUDqZfOEXBuK9btm6+FdGGC94KjeXXEKz0EGn1jEq7WB4cz+HGOsCuRG
 MtMMevC0N+t1qEhhNzVBah6P6CwJPHmtBGD8zD2cU4KTmDg3PYN5Lubb4HUwgnqFmrh7UyGPm7z
 7BGbuho14cOznn8XXqbfIYZP8ayHvHadn+m1yrSFTA0v08P71/QB15j6tOoVDXfX9wOomDWChPm
 fkCkWQauSFt9R9n5aHu4RmoEYPabogLznf99Y3oiCwMZtoLDA2qBmBtbQHAOTtslKSV3qDgJ3Dz
 6vSZhMcPnM7mMM1SveA==
X-Authority-Analysis: v=2.4 cv=Tp7rRTXh c=1 sm=1 tr=0 ts=69452b5a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=C3Rb7UmAfwJbGrY5-NcA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190087
X-Mailman-Approved-At: Fri, 19 Dec 2025 13:20:32 +0000
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

There are quite a few reports off-list that, at least on Hamoa based
devices, there are some IOMMU faults and some abnormal artifacts on eDP.
These have been traced to the quad pipe support introduced in 6.19-rc1.

Meanwhile, Marijn reported some issues in some dual-DSI dual-DSC scenario.

Off-list discussion concluded into reverting these two commits to avoid
the described issues.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (2):
      Revert "drm/msm/dpu: support plane splitting in quad-pipe case"
      Revert "drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case"

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |  38 ++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      |  29 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c        | 137 +++++++----------------
 7 files changed, 73 insertions(+), 145 deletions(-)
---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251219-drm-msm-dpu-revert-quad-pipe-broken-7b249567917e

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

