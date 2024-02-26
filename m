Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0495E8667F9
	for <lists+freedreno@lfdr.de>; Mon, 26 Feb 2024 03:12:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECAEB10E5DC;
	Mon, 26 Feb 2024 02:11:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SHGJcWs3";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4992B10E5CE
 for <freedreno@lists.freedesktop.org>; Mon, 26 Feb 2024 02:11:57 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-512f7332252so1255799e87.0
 for <freedreno@lists.freedesktop.org>; Sun, 25 Feb 2024 18:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708913515; x=1709518315; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=18tJ6UzqGWS5ZS/rCnpPVeNsGeBIHv5z+8hQsl9S7jI=;
 b=SHGJcWs3PraDTOv1oa5cFCdE6hjEPA6X4ezEv60agprMy+hwgOTS74vVOClSor6EAg
 j3xsZJFSjEcH7yGWxAyXtuV2JpdTIbsx5Z7VHdm/tgA5RzSn3cB2Dy6p8PXQpkj+YpcO
 /dcbKuu95i7esCcOOaWB+lv0E/WP3ltpvFlbJ23hZXBn7FiPNZs/2sdVMXh+R0F995Oq
 WlkjiRXdG1hXJSh1qmWEsbL30eqrE+pXssInjKqja6EVo0zU8KfHZk/2WYE23ll5rN92
 JRHEeFfgGvqLhHX9IilyOD1+6plbCFvw7D8kCPOGLAGMw+hRuqom+VAORjxFoWY7+S6t
 HEwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708913515; x=1709518315;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=18tJ6UzqGWS5ZS/rCnpPVeNsGeBIHv5z+8hQsl9S7jI=;
 b=vw+/RTGo2jY6Kw/pvlg15ZxZlRrLgmnHTnKj0gKy3ddQOIWmNpeuI3pDg0bRCA8gWv
 kCmEpIg9Gi+cdV6ks/tEASeXD6eBAz1rjcIP6dOflC/GSpx4do0brMewNtvdneI3CfXU
 cyJNOYYlX6jLSWjF/lhytEcQZbQMPc1/Vf3NqoLeGeh4zNsz5msrxNBuiZQjqsEOXrlh
 jKCJ80BnFtPkYFAXfA5AiN7EOUL0MxJRiEFYzcuk4isCtxn+3DGNT3iuBMflu0szImCs
 u2/PWyIn8SD3R1YwJyjX8PRia9qJ6cA7FnHy1V5mD+1jrDE9pFXvWYzHZoaYVol7jhPx
 Dr+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTMGR5H73bnnAeLaOGGoFRQyGROG4M+DSGDgcIPdInvDgkFIuvbHThAI9VcA2iYUVhHwacIs/ZmUY82YEapUnk7rK6UDAkTXRcecziDPXC
X-Gm-Message-State: AOJu0YyrNdz1P1BGIXHbyB2e/EA0K7Bdycmf/rUWNHOg51yJ/0ujUdIB
 TaShviDXKyh7eHgkckf3GfCTFv2cNFHAw4R7UvlOd/1tBKlFF6Dar5sFFaBgLww=
X-Google-Smtp-Source: AGHT+IGx7Awy//hcII4n+oRauO+5C95ueBAjeHayplcepthN/F68ja0f/KxiVX2XJaG/pH3wqhgU4w==
X-Received: by 2002:a05:6512:2109:b0:512:b932:7913 with SMTP id
 q9-20020a056512210900b00512b9327913mr2888939lfr.41.1708913515397; 
 Sun, 25 Feb 2024 18:11:55 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi.
 [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a056512358b00b00512e39ce472sm676176lfr.175.2024.02.25.18.11.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Feb 2024 18:11:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 26 Feb 2024 04:11:45 +0200
Subject: [PATCH RFC 09/12] drm/msm/headergen: generate _shipped files
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-fd-xml-shipped-v1-9-86bb6c3346d2@linaro.org>
References: <20240226-fd-xml-shipped-v1-0-86bb6c3346d2@linaro.org>
In-Reply-To: <20240226-fd-xml-shipped-v1-0-86bb6c3346d2@linaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1828;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=JyJ2naEA9+YJx/+oipu+eUllHx2U7M8qpx+d+P3kb+o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl2/NhQ5hUimItcSECWaPO/JC8mPEonJzKnRRJr
 ZQN9JCP0jyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZdvzYQAKCRCLPIo+Aiko
 1XAgB/47QZNDdURBNmftlahtNPqFQ41iZc3XuPDbBZhQR69OOxcWir3zjFsCoPTsBoKQHuKDu5p
 QGsdtUFWG1eJAsrdIIer0q5RugUFdgC5MB+dwQ6rlDDkwyRYAzRfmoodyXCV6PEc6y7farR0RpK
 2lOSZb9+Fi39wUWtH9RpTOJjRQ3BZY1AgkfvT06IUs02MNq7jm5RQDLnLz+ymEVHcdgBqkr3ZHd
 2qdP8LuCXHR2g6uJoyXVsQE/h5JCHCoB73otR85c/w23NZc1KddSlzF9hzAEcEna1gBy0ZqyzBx
 J/rpd4H7zDnzZ+b+5OHDn3PWqehjd9jn81a8GmSQcEco5tJ2
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Change headergen semantics to generate the .xml.h_shipped files instead
of just generating headers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/headergen2/headergen2.c | 33 +++++++++++++++++++----------
 1 file changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/headergen2/headergen2.c b/drivers/gpu/drm/msm/headergen2/headergen2.c
index 2e5c4593d865..7d884fa547b2 100644
--- a/drivers/gpu/drm/msm/headergen2/headergen2.c
+++ b/drivers/gpu/drm/msm/headergen2/headergen2.c
@@ -417,30 +417,41 @@ static void printhead(struct fout f, struct rnndb *db) {
 
 int main(int argc, char **argv) {
 	char *file;
+	char *out_dir;
 	struct rnndb *db;
 	int i, j;
 
-	if (argc < 2) {
-		fprintf(stderr, "Usage:\n\theadergen database-file\n");
-		exit(1);
+	if (argv[1] && !strcmp(argv[1], "--no-asserts")) {
+		no_asserts = true;
+		argv++;
+		argc--;
 	}
 
-	if ((argc >= 3) && !strcmp(argv[1], "--no-asserts")) {
-		no_asserts = true;
-		file = argv[2];
-	} else {
-		file = argv[1];
+	if (argc != 3) {
+		fprintf(stderr, "Usage:\n\theadergen database-file out-dir\n");
+		exit(1);
 	}
 
+	file = argv[1];
+	out_dir = argv[2];
+
 	rnn_init();
 	db = rnn_newdb();
 	rnn_parsefile (db, file);
 	rnn_prepdb (db);
 	for(i = 0; i < db->filesnum; ++i) {
-		char *dstname = malloc(strlen(db->files[i]) + 3);
+		char *curfile = basename(db->files[i]);
+		char *dstname;
 		char *pretty;
-		strcpy(dstname, db->files[i]);
-		strcat(dstname, ".h");
+		int ret;
+
+		ret = asprintf(&dstname, "%s/%s.h_shipped",
+			       out_dir, curfile);
+		if (ret < 0) {
+			perror("asprintf");
+			exit(1);
+		}
+
 		struct fout f = { db->files[i], fopen(dstname, "w") };
 		if (!f.file) {
 			perror(dstname);

-- 
2.39.2

